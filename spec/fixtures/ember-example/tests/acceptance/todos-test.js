import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'ember-example/tests/helpers/start-app';
import Pretender from 'pretender';

let TODOS = [
  {id: 1, title: "write a blog post"},
  {id: 2, title: "let people read it"},
  {id: 3, title: "... profit"}
];

module('Acceptance | todos', {
  beforeEach: function() {
    this.application = startApp();

    this.server = new Pretender(function() {
      this.get('/todos', function(){
        var json = {
          todos: TODOS
        };

        return [200, {}, JSON.stringify(json)];
      });
    });
  },

  afterEach: function() {
    Ember.run(this.application, 'destroy');
    this.server.shutdown();
  }
});

test('visiting /todos', function(assert) {
  visit('/todos');

  andThen(function() {
    var title = find('h1');
    assert.equal(title.text(), 'Todo List');

    var todos = find('.todo-item');
    assert.equal(todos.length, TODOS.length);

    assert.equal(currentURL(), '/todos');
  });
});

