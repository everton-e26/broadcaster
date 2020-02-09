abstract class IBroadcast<T> {
  Stream<T> get stream;
  T get value;
  set value(T v);
  close();
}
