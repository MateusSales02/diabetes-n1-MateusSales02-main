import 'state.dart';

class StateMachine {
  final List<State> _states = [
    State(
      'Paciente com glicemia capilar > 250mg/dL. \n\nHá sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?',
      'Sim',
      'Não',
    ),
    State(
      'Há suspeita de doença intercorrente (excluindo emergências)?',
      'Sim',
      'Não',
    ),
    State(
      'Cetonúria disponível (Se indisponível, considerar negativa)?',
      'Positiva',
      'Negativa',
    ),
    State(
      'Aplicar insulina regular e reavaliar glicemia capilar em 2 horas.\n\nGlicemia abaixo de 250mg/dL?',
      'Sim',
      'Não',
    ),
    State(
      'Provável descompensação crônica. Ajustar tratamento (considerar insulina). Solicitar controle de glicemia capilar. Orientar sinais de alarme e reavaliação breve',
      'Reiniciar',
      '',
    ),
    State(
      'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9% enquanto aguarda o transporte',
      'Reiniciar',
      '',
    ),
    State(
      'Tratar complicações agudas. Aumentar transitoriamente dose total de insulina até resolução do quadro.',
      'Reiniciar',
      '',
    ),
  ];

  int _currentStateIndex = 0;

  State? getCurrentState() {
    if (_currentStateIndex >= 0 && _currentStateIndex < _states.length) {
      return _states[_currentStateIndex];
    }
    return null;
  }

  void makeChoice(int choiceIndex) {
    if (choiceIndex == 1 || choiceIndex == 2) {
      final State? currentState = getCurrentState();
      if (currentState != null) {
        if (choiceIndex == 1) {
        } else if (choiceIndex == 2) {}
      }
    }
  }

  String getStep() {
    return _states[_currentStateIndex].text;
  }

  String getStepChoice1() {
    return _states[_currentStateIndex].choice1;
  }

  String getStepChoice2() {
    return _states[_currentStateIndex].choice2;
  }

  bool isChoice2Available() {
    return _currentStateIndex <= 3;
  }

  void nextStep(int choice) {
    if (!isChoice2Available()) return restart();

    if (_currentStateIndex == 3) {
      if (choice == 1)
        _currentStateIndex = 6;
      else
        _currentStateIndex = 5;

      return;
    }

    if (_currentStateIndex == 2) {
      if (choice == 1)
        _currentStateIndex = 5;
      else
        _currentStateIndex = 3;

      return;
    }

    if (_currentStateIndex == 1) {
      if (choice == 1)
        _currentStateIndex = 2;
      else
        _currentStateIndex = 4;

      return;
    }

    if (_currentStateIndex == 0) {
      if (choice == 1)
        _currentStateIndex = 5;
      else
        _currentStateIndex = 1;

      return;
    }
  }

  void restart() {
    _currentStateIndex = 0;
  }

  bool itschoiceisavaliable() {
    return _currentStateIndex <= 3;
  }
}
