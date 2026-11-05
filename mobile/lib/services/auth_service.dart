class AuthService {
  // TODO: integrate Supabase Auth, sessions, and secure credential handling.
  Future<void> signIn(String email, String password) => Future.error(
    UnimplementedError('Authentication is not implemented.'));
  Future<void> signOut() => Future.error(
    UnimplementedError('Authentication is not implemented.'));
}
