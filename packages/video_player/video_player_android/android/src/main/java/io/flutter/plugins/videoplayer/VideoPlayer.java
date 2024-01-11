// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.videoplayer;

import static com.google.android.exoplayer2.Player.REPEAT_MODE_ALL;
import static com.google.android.exoplayer2.Player.REPEAT_MODE_OFF;

import android.os.CountDownTimer;
//import android.os.Handler;
import android.content.Context;
import android.net.Uri;
import android.view.Surface;
import androidx.annotation.NonNull;
import androidx.annotation.VisibleForTesting;
import com.google.android.exoplayer2.C;
import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.MediaItem;
import com.google.android.exoplayer2.PlaybackException;
import com.google.android.exoplayer2.PlaybackParameters;
import com.google.android.exoplayer2.Player;
import com.google.android.exoplayer2.Player.Listener;
import com.google.android.exoplayer2.audio.AudioAttributes;
import com.google.android.exoplayer2.source.MediaSource;
import com.google.android.exoplayer2.source.ProgressiveMediaSource;
import com.google.android.exoplayer2.source.dash.DashMediaSource;
import com.google.android.exoplayer2.source.dash.DefaultDashChunkSource;
import com.google.android.exoplayer2.source.hls.HlsMediaSource;
import com.google.android.exoplayer2.source.smoothstreaming.DefaultSsChunkSource;
import com.google.android.exoplayer2.source.smoothstreaming.SsMediaSource;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.DefaultDataSource;
import com.google.android.exoplayer2.upstream.DefaultHttpDataSource;
import com.google.android.exoplayer2.util.Util;
import io.flutter.plugin.common.EventChannel;
import io.flutter.view.TextureRegistry;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Timer;
import java.util.*;
import java.util.List;
import java.util.Map;
import java.io.*;

final class VideoPlayer {
  private static final String FORMAT_SS = "ss";
  private static final String FORMAT_DASH = "dash";
  private static final String FORMAT_HLS = "hls";
  private static final String FORMAT_OTHER = "other";

  private ExoPlayer exoPlayer;
  private String uri;

  private Surface surface;

  private final TextureRegistry.SurfaceTextureEntry textureEntry;

  private QueuingEventSink eventSink;
  //private Timer timeoutTimer;
  //private Handler handler;
  private CountDownTimer countdown;

  private final EventChannel eventChannel;

  private static final String USER_AGENT = "User-Agent";

  @VisibleForTesting boolean isInitialized = false;
  
  private boolean isLoadingNewAsset = false;

  private final VideoPlayerOptions options;

  private DefaultHttpDataSource.Factory httpDataSourceFactory = new DefaultHttpDataSource.Factory();

  VideoPlayer(
      Context context,
      EventChannel eventChannel,
      TextureRegistry.SurfaceTextureEntry textureEntry,
      String dataSource,
      String formatHint,
      @NonNull Map<String, String> httpHeaders,
      VideoPlayerOptions options) {
    this.eventChannel = eventChannel;
    this.textureEntry = textureEntry;
    this.options = options;
    this.uri = "";
    //this.handler = new Handler();
    this.countdown = new CountDownTimer(30000, 1000) {

        public void onTick(long millisUntilFinished) {
            //mTextField.setText("seconds remaining: " + millisUntilFinished / 1000);
        }

        public void onFinish() {
            //mTextField.setText("done!");
        }
    };

    ExoPlayer exoPlayer = new ExoPlayer.Builder(context).build();
    Uri uri = Uri.parse(dataSource);

    buildHttpDataSourceFactory(httpHeaders);
    DataSource.Factory dataSourceFactory =
        new DefaultDataSource.Factory(context, httpDataSourceFactory);

    MediaSource mediaSource = buildMediaSource(uri, dataSourceFactory, formatHint);

    exoPlayer.setMediaSource(mediaSource);
    exoPlayer.prepare();

    setUpVideoPlayer(exoPlayer, new QueuingEventSink());
  }

  // Constructor used to directly test members of this class.
  @VisibleForTesting
  VideoPlayer(
      ExoPlayer exoPlayer,
      EventChannel eventChannel,
      TextureRegistry.SurfaceTextureEntry textureEntry,
      VideoPlayerOptions options,
      QueuingEventSink eventSink,
      DefaultHttpDataSource.Factory httpDataSourceFactory) {
    this.eventChannel = eventChannel;
    this.textureEntry = textureEntry;
    this.options = options;
    this.httpDataSourceFactory = httpDataSourceFactory;

    this.uri = "";
    //this.handler = new Handler();
        this.countdown = new CountDownTimer(30000, 1000) {

        public void onTick(long millisUntilFinished) {
            //mTextField.setText("seconds remaining: " + millisUntilFinished / 1000);
        }

        public void onFinish() {
            //mTextField.setText("done!");
        }
    };

    setUpVideoPlayer(exoPlayer, eventSink);
  }

  @VisibleForTesting
  public void buildHttpDataSourceFactory(@NonNull Map<String, String> httpHeaders) {
    final boolean httpHeadersNotEmpty = !httpHeaders.isEmpty();
    final String userAgent =
        httpHeadersNotEmpty && httpHeaders.containsKey(USER_AGENT)
            ? httpHeaders.get(USER_AGENT)
            : "ExoPlayer";

    httpDataSourceFactory.setUserAgent(userAgent).setAllowCrossProtocolRedirects(true);

    if (httpHeadersNotEmpty) {
      httpDataSourceFactory.setDefaultRequestProperties(httpHeaders);
    }
  }

  private MediaSource buildMediaSource(
      Uri uri, DataSource.Factory mediaDataSourceFactory, String formatHint) {
    int type;
    if (formatHint == null) {
      type = Util.inferContentType(uri);
    } else {
      switch (formatHint) {
        case FORMAT_SS:
          type = C.CONTENT_TYPE_SS;
          break;
        case FORMAT_DASH:
          type = C.CONTENT_TYPE_DASH;
          break;
        case FORMAT_HLS:
          type = C.CONTENT_TYPE_HLS;
          break;
        case FORMAT_OTHER:
          type = C.CONTENT_TYPE_OTHER;
          break;
        default:
          type = -1;
          break;
      }
    }
    switch (type) {
      case C.CONTENT_TYPE_SS:
        return new SsMediaSource.Factory(
                new DefaultSsChunkSource.Factory(mediaDataSourceFactory), mediaDataSourceFactory)
            .createMediaSource(MediaItem.fromUri(uri));
      case C.CONTENT_TYPE_DASH:
        return new DashMediaSource.Factory(
                new DefaultDashChunkSource.Factory(mediaDataSourceFactory), mediaDataSourceFactory)
            .createMediaSource(MediaItem.fromUri(uri));
      case C.CONTENT_TYPE_HLS:
        return new HlsMediaSource.Factory(mediaDataSourceFactory)
            .createMediaSource(MediaItem.fromUri(uri));
      case C.CONTENT_TYPE_OTHER:
        return new ProgressiveMediaSource.Factory(mediaDataSourceFactory)
            .createMediaSource(MediaItem.fromUri(uri));
      default:
        {
          throw new IllegalStateException("Unsupported type: " + type);
        }
    }
  }

  private void setUpVideoPlayer(ExoPlayer exoPlayer, QueuingEventSink eventSink) {
    this.exoPlayer = exoPlayer;
    this.eventSink = eventSink;

    eventChannel.setStreamHandler(
        new EventChannel.StreamHandler() {
          @Override
          public void onListen(Object o, EventChannel.EventSink sink) {
            eventSink.setDelegate(sink);
          }

          @Override
          public void onCancel(Object o) {
            eventSink.setDelegate(null);
          }
        });

    surface = new Surface(textureEntry.surfaceTexture());
    exoPlayer.setVideoSurface(surface);
    setAudioAttributes(exoPlayer, options.mixWithOthers);

    exoPlayer.addListener(
        new Listener() {
          private boolean isBuffering = false;

          public void setBuffering(boolean buffering) {
            if (isBuffering != buffering) {
              isBuffering = buffering;
              Map<String, Object> event = new HashMap<>();
              event.put("event", isBuffering ? "bufferingStart" : "bufferingEnd");
              eventSink.success(event);
            }
          }

          @Override
          public void onPlaybackStateChanged(final int playbackState) {
            countdown.cancel();
            System.out.println("FOO JAVA new state " + uri);

            if (playbackState == Player.STATE_BUFFERING) {
              System.out.println("FOO JAVA state buffering " + uri);
              setBuffering(true);
              sendBufferingUpdate();
            } else if (playbackState == Player.STATE_READY) {
              System.out.println("FOO JAVA state ready " + uri);
              if (!isInitialized) {
                isInitialized = true;
                sendInitialized();
              }

              if (isLoadingNewAsset) {
                System.out.println("FOO JAVA send reload end " + uri);
                isLoadingNewAsset = false;
                //handler.removeCallbacksAndMessages(null);
                sendReloadingEnd();
              }
            } else if (playbackState == Player.STATE_ENDED) {
              System.out.println("FOO JAVA state ended " + uri);
              Map<String, Object> event = new HashMap<>();
              event.put("event", "completed");
              eventSink.success(event);
            }

            if (playbackState != Player.STATE_BUFFERING) {
              System.out.println("FOO JAVA state not buffering " + uri);
              setBuffering(false);
            }
          }

          @Override
          public void onPlayerError(@NonNull final PlaybackException error) {
            System.out.println("FOO JAVA player error " + uri);
            setBuffering(false);
            if (eventSink != null) {
              eventSink.error("VideoError", "Video player had error " + error, null);
            }
          }

          @Override
          public void onIsPlayingChanged(boolean isPlaying) {
            System.out.println("FOO JAVA is playing changed " + uri);
            if (eventSink != null) {
              Map<String, Object> event = new HashMap<>();
              event.put("event", "isPlayingStateUpdate");
              event.put("isPlaying", isPlaying);
              eventSink.success(event);
            }
          }
        });
  }

  void sendBufferingUpdate() {
    Map<String, Object> event = new HashMap<>();
    event.put("event", "bufferingUpdate");
    List<? extends Number> range = Arrays.asList(0, exoPlayer.getBufferedPosition());
    // iOS supports a list of buffered ranges, so here is a list with a single range.
    event.put("values", Collections.singletonList(range));
    eventSink.success(event);
  }

  private static void setAudioAttributes(ExoPlayer exoPlayer, boolean isMixMode) {
    exoPlayer.setAudioAttributes(
        new AudioAttributes.Builder().setContentType(C.AUDIO_CONTENT_TYPE_MOVIE).build(),
        !isMixMode);
  }

  // class Running extends TimerTask {
  //     @Override
  //     public void run() {
  //       if (eventSink != null) {
  //         eventSink.error("VideoError", "Video player timed out", null);
  //         System.out.println("FOO JAVA TIMER TIMEDOUT " + uri);
  //       }
  //     }
  //  }

  void loadAsset(Context context,
      String dataSource,
      String formatHint,
      @NonNull Map<String, String> httpHeaders) {
    Uri uri = Uri.parse(dataSource);

    buildHttpDataSourceFactory(httpHeaders);
    DataSource.Factory dataSourceFactory =
        new DefaultDataSource.Factory(context, httpDataSourceFactory);

    MediaSource mediaSource = buildMediaSource(uri, dataSourceFactory, formatHint);

    exoPlayer.setMediaSource(mediaSource);
    this.uri = uri.toString();
    exoPlayer.prepare();

    isLoadingNewAsset = true;

    Map<String, Object> event = new HashMap<>();
    event.put("event", "reloadingStart");
    eventSink.success(event);

    boolean hej = exoPlayer.getPlaybackLooper().getThread().isAlive();
    System.out.println("FOO JAVA reloadStart check thread isalive " + hej + " uri:" + uri);

    // TimerTask task = new TimerTask() {
    //     @Override
    //     public void run() { 
    //       if (eventSink != null) {
    //         eventSink.error("VideoError", "Video player timed out", null);
    //         System.out.println("FOO JAVA TIMER TIMEDOUT " + uri);
    //       }
    //       System.out.println("FOO JAVA TIMER TIMEDOUT and canceled " + uri);
    //       timeoutTimer.cancel();
    //     }
    // };

    // final Runnable r = new Runnable() {
    //   public void run() {
    //       if (eventSink != null) {
    //         eventSink.error("VideoError", "Video player timed out", null);
    //         System.out.println("FOO JAVA TIMER TIMEDOUT " + uri);
    //       }
    //   }
    // };

    //handler.removeCallbacksAndMessages(null);
    System.out.println("FOO JAVA previous timer cancelled uri:" + uri);
    //handler.postDelayed(r, 1000);

    this.countdown.cancel();
    this.countdown = new CountDownTimer(1000, 1000) {

          public void onTick(long millisUntilFinished) {
              //mTextField.setText("seconds remaining: " + millisUntilFinished / 1000);
          }

          public void onFinish() {
                if (eventSink != null) {
                  eventSink.error("VideoError", "Video player timed out, no events", null);
                  System.out.println("FOO JAVA TIMER TIMEDOUT, no events " + uri);
                }
          }
      }.start();

    System.out.println("FOO JAVA timer started uri:" + uri);
  }

  void play() {
    exoPlayer.setPlayWhenReady(true);
  }

  void pause() {
    exoPlayer.setPlayWhenReady(false);
  }

  void setLooping(boolean value) {
    exoPlayer.setRepeatMode(value ? REPEAT_MODE_ALL : REPEAT_MODE_OFF);
  }

  void setVolume(double value) {
    float bracketedValue = (float) Math.max(0.0, Math.min(1.0, value));
    exoPlayer.setVolume(bracketedValue);
  }

  void setPlaybackSpeed(double value) {
    // We do not need to consider pitch and skipSilence for now as we do not handle them and
    // therefore never diverge from the default values.
    final PlaybackParameters playbackParameters = new PlaybackParameters(((float) value));

    exoPlayer.setPlaybackParameters(playbackParameters);
  }

  void seekTo(int location) {
    exoPlayer.seekTo(location);
  }

  long getPosition() {
    return exoPlayer.getCurrentPosition();
  }

  @SuppressWarnings("SuspiciousNameCombination")
  @VisibleForTesting
  void sendInitialized() {
    if (isInitialized) {
      Map<String, Object> event = new HashMap<>();
      event.put("event", "initialized");
      event.put("duration", exoPlayer.getDuration());

      if (exoPlayer.getVideoFormat() != null) {
        Format videoFormat = exoPlayer.getVideoFormat();
        int width = videoFormat.width;
        int height = videoFormat.height;
        int rotationDegrees = videoFormat.rotationDegrees;
        // Switch the width/height if video was taken in portrait mode
        if (rotationDegrees == 90 || rotationDegrees == 270) {
          width = exoPlayer.getVideoFormat().height;
          height = exoPlayer.getVideoFormat().width;
        }
        event.put("width", width);
        event.put("height", height);

        // Rotating the video with ExoPlayer does not seem to be possible with a Surface,
        // so inform the Flutter code that the widget needs to be rotated to prevent
        // upside-down playback for videos with rotationDegrees of 180 (other orientations work
        // correctly without correction).
        if (rotationDegrees == 180) {
          event.put("rotationCorrection", rotationDegrees);
        }
      }

      eventSink.success(event);
    }
  }

  // Almost copy of sendInitialized
  void sendReloadingEnd() {
    if (!isLoadingNewAsset) {
      Map<String, Object> event = new HashMap<>();
      event.put("event", "reloadingEnd");
      event.put("duration", exoPlayer.getDuration());

      if (exoPlayer.getVideoFormat() != null) {
        Format videoFormat = exoPlayer.getVideoFormat();
        int width = videoFormat.width;
        int height = videoFormat.height;
        int rotationDegrees = videoFormat.rotationDegrees;
        // Switch the width/height if video was taken in portrait mode
        if (rotationDegrees == 90 || rotationDegrees == 270) {
          width = exoPlayer.getVideoFormat().height;
          height = exoPlayer.getVideoFormat().width;
        }
        event.put("width", width);
        event.put("height", height);

        // Rotating the video with ExoPlayer does not seem to be possible with a Surface,
        // so inform the Flutter code that the widget needs to be rotated to prevent
        // upside-down playback for videos with rotationDegrees of 180 (other orientations work
        // correctly without correction).
        if (rotationDegrees == 180) {
          event.put("rotationCorrection", rotationDegrees);
        }
      }

      eventSink.success(event);
    }
  }

  void dispose() {
    if (isInitialized) {
      exoPlayer.stop();
    }
    textureEntry.release();
    eventChannel.setStreamHandler(null);
    //timeoutTimer.purge();
    if (surface != null) {
      surface.release();
    }
    if (exoPlayer != null) {
      exoPlayer.release();
    }
  }
}
