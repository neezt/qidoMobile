import 'package:qido_colaboradores/model/usuario.dart';

import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FotosBitacoraWidget extends StatefulWidget {
  const FotosBitacoraWidget({Key key, this.usuario}) : super(key: key);
  final Usuario usuario;
  @override
  _FotosBitacoraWidgetState createState() => _FotosBitacoraWidgetState();
}

class _FotosBitacoraWidgetState extends State<FotosBitacoraWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        scale: 0.9,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        scale: 0.9,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Fotos',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Text(
                  'Rosario Armenta - 22 mayo de 2022',
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        'https://i.guim.co.uk/img/media/5e4b4aa0152a9f448eb8230589d243d00729cb29/0_257_4896_2937/master/4896.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=79a314ada0fa30855f9b3a36b75ee3ee',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x2B202529),
                        offset: Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                ).animated([animationsMap['containerOnPageLoadAnimation1']]),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 44),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        'https://www.foodnavigator.com/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/9/3/5/1/2431539-1-eng-GB/Emotional-eating-How-do-the-elderly-feel-about-food.jpg',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x2B202529),
                        offset: Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                ).animated([animationsMap['containerOnPageLoadAnimation2']]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
