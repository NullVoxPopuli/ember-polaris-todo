import { on } from '@ember/modifier';

import { cell } from 'ember-resources';

import Todo from './todo';

const canToggle = cell(true);
const disableToggleAll = () => canToggle.current = false;
const enableToggleAll = () => canToggle.current = true;

<template>
  {{#if @todos.length}}
    <section class='main'>

      {{#if canToggle.current}}
        <input
          id='toggle-all'
          class='toggle-all'
          type='checkbox'
          checked={{@areAllComplete}}
          {{on 'change' @toggleAll}}
        >
        <label for='toggle-all'>Mark all as complete</label>
      {{/if}}

      <ul class='todo-list'>
        {{#each @todos as |todo|}}
          <Todo
            @todo={{todo}}
            @onStartEditing={{disableToggleAll}}
            @onFinishEditing={{enableToggleAll}}
          />
        {{/each}}
      </ul>
    </section>
  {{/if}}
</template>
