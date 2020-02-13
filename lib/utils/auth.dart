import 'package:wassa/data/database_helper.dart';

enum AuthState {LOGGED_IN, LOGGED_OUT}

abstract class AuthStateListener {
  void onAuthStateChanged(AuthState state);
}

// implementation of observer/subscriber pattern
class AuthStateProvider {
  static final AuthStateProvider _instance = new AuthStateProvider.internal();

  List<AuthStateListener> _subscribes;

  factory AuthStateProvider() => _instance;
  AuthStateProvider.internal(){
    _subscribes = new List<AuthStateListener>();
    initState();
  }

  void initState() async {
    var db = new DatabaseHelper();
    var isLoggedIn = await db.isLoggedIn();
    if(isLoggedIn)
      notify(AuthState.LOGGED_IN);
    else
    notify(AuthState.LOGGED_OUT);
  }

  void subscribe(AuthStateListener listner){
    _subscribes.add(listner);
  }

  void dispode(AuthStateListener listener){
    for(var l in _subscribes){
      if(l == listener)
        _subscribes.remove(l);
    }
  }

  void notify(AuthState state){
    _subscribes.forEach((AuthStateListener s) => s.onAuthStateChanged(state));
  }
}