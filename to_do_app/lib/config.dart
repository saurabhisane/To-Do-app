const String url = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://192.168.49.2:32300/',
);

final registration = "${url}registration";
final login = "${url}login";
final todo = "${url}todo";
final todoData = "${url}getTodoData";
final todoDelete = "${url}deleteTodo";
