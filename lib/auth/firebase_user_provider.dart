import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WarshtcomnewFirebaseUser {
  WarshtcomnewFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WarshtcomnewFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WarshtcomnewFirebaseUser> warshtcomnewFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WarshtcomnewFirebaseUser>(
      (user) {
        currentUser = WarshtcomnewFirebaseUser(user);
        return currentUser!;
      },
    );
