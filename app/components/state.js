import { tracked } from '@glimmer/tracking';

class Todo {
  @tracked title = '';
  @tracked completed = false;

  constructor(title) {
    this.title = title;
  }
}

export function state() {
  return new State();
}

export class State {
  @tracked data = load();

  get all() {
    return this.data;
  }

  get incomplete() {
    return this.data.filter(todo => {
      return todo.completed === false;
    });
  }

  get completed() {
    return this.data.filter(todo => {
      return todo.completed;
    });
  }

  toggle = (todo) => {
    todo.completed = !todo.completed;

    this.persist();
  }

  add = (title) => {
    let newTodo = new Todo(title);

    this.data = [...this.data, newTodo];

    this.persist();
  }

  remove = (todo) => {
    this.data = this.data.filter(existing => {
      return existing !== todo;
    });

    this.persist();
  }

  clearCompleted = () => {
    this.data = this.incomplete;
    this.persist();
  }

  updateTitle = (todo, title) => {
    todo.title = title;

    this.persist();
  }

  persist = () => {
    persist(this.data);
  }
}

/**************************
 * local storage helpers
 ***************************/

function load() {
  let lsValue = localStorage.getItem('todos');
  let array = (lsValue && JSON.parse(lsValue));

  let todos = deserializeTodoData(array);

  return todos;
}

function persist(todos) {
  let data = serializeTodos(todos);
  let result = JSON.stringify(data);

  localStorage.setItem('todos', result);

  return result;
}

function serializeTodos(todos) {
  return todos.map(todo => ({ title: todo.title, completed: todo.completed }));
}

function deserializeTodoData(data) {
  return (data || []).map(json => {
    let todo = new Todo(json.title);

    todo.completed = json.completed;

    return todo;
  });
}

