import 'package:qido_colaboradores/model/usuario.dart';

import '../bitacoravariables.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../lista_pacientes_v2/lista_pacientes_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BitacoraCompletadaWidget extends StatefulWidget {
  const BitacoraCompletadaWidget({Key key, this.usuario}) : super(key: key);

  // final int idTemp;
  // final List listTemp;
  final Usuario usuario;
  @override
  _BitacoraCompletadaWidgetState createState() =>
      _BitacoraCompletadaWidgetState();
}

resetVariables() {
  desayunoBitacora = 0;
  comidaBitacora = 0;
  cenaBitacora = 0;
  estadoAnimoBitacora = null;
  temperaturaBitacora = 0.0;
  presionSistolicaBitacora = 0;
  presionDiastolicaBitacora = 0;
  glucosaBitacora = 0;
  oxigenoBitacora = 0;
  idServicioBitacora = 0;
  idColaboradorBitacora = 0;
  actividadesBitacora = [];
  flagResetDesayuno = true;
  flagResetComida = true;
  flagResetCena = true;
  flagResetCuidadosActividades = true;
  flagResetEstadoAnimo = true;
  flagResetTemperatura = true;
  flagResetSistolica = true;
  flagResetDiastolica = true;
  flagResetGlucosa = true;
  flagResetOxigeno = true;
}

class _BitacoraCompletadaWidgetState extends State<BitacoraCompletadaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

    @override
  void initState() {
    super.initState();
    resetVariables();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF39D2C0),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      frameRate: FrameRate(60),
                      repeat: false,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Text(
                '¡Listo!',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Gracias por completar la bitácora.',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: ListaPacientesV2Widget(),
                      ),
                    );
                  },
                  text: 'Volver al menú',
                  options: FFButtonOptions(
                    width: 130,
                    height: 50,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF39D2C0),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
