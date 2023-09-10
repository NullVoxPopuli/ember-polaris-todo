import { on } from '@ember/modifier';

function isPlural(num) {
  return num !== 1; // > 1 || === 0
}

function suffix(list) {
  return isPlural(list.length) ? 'items' : 'item';
}

<template>
  {{#if @state.all.length}}
    <footer class='footer'>

      <span class='todo-count'>
        <strong>{{@state.remaining.length}}</strong> {{suffix @state.todos}} left
      </span>

      <ul class='filters'>
        <li>
          <button {{on 'click' @state.viewAll}}>All</button>
          <button {{on 'click' @state.viewActive}}>Active</button>
          <button {{on 'click' @state.viewCompleted}}>Completed</button>
        </li>
      </ul>

      {{#if @state.completed.length}}
        <button
          type='button'
          class='clear-completed'
          {{on 'click' @state.clearCompleted}}
        >
          Clear completed
        </button>
      {{/if}}

    </footer>
  {{/if}}
</template>
