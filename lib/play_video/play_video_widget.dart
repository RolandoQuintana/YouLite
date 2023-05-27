import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'play_video_model.dart';
export 'play_video_model.dart';

class PlayVideoWidget extends StatefulWidget {
  const PlayVideoWidget({
    Key? key,
    this.videoURLParam,
  }) : super(key: key);

  final String? videoURLParam;

  @override
  _PlayVideoWidgetState createState() => _PlayVideoWidgetState();
}

class _PlayVideoWidgetState extends State<PlayVideoWidget> {
  late PlayVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayVideoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: FlutterFlowYoutubePlayer(
                    url: FFAppState().videoURLPath,
                    autoPlay: false,
                    looping: true,
                    mute: false,
                    showControls: true,
                    showFullScreen: true,
                    pauseOnNavigate: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
