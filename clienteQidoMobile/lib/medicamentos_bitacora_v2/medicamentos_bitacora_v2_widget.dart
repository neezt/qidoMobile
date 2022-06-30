import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicamentosBitacoraV2Widget extends StatefulWidget {
  const MedicamentosBitacoraV2Widget({Key key}) : super(key: key);

  @override
  _MedicamentosBitacoraV2WidgetState createState() =>
      _MedicamentosBitacoraV2WidgetState();
}

class _MedicamentosBitacoraV2WidgetState
    extends State<MedicamentosBitacoraV2Widget> with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
          'Medicamentos',
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
                        'https://media.phillyvoice.com/media/images/Unused_meds.2e16d0ba.fill-735x490.jpg',
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
                ).animated([animationsMap['containerOnPageLoadAnimation']]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
