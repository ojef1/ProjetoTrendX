import 'package:flutter/material.dart';

// Classe que gerencia o estado do tema escuro e notifica os ouvintes sobre
class ChangeTheme extends ChangeNotifier{
  bool _isDarkMode = false;

  // Getter para obter o estado atual do tema escuro.
  bool get isDarkMode => _isDarkMode;

  // Método para alternar entre os modos de tema escuro e claro.
  void toggleTheme(){
    _isDarkMode = !_isDarkMode;
    // Notifica os ouvintes (widgets que estão ouvindo mudanças neste objeto).
    notifyListeners();
  }
}