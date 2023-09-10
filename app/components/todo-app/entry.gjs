import { fn } from '@ember/helper';
import { on } from '@ember/modifier';

function handleSubmit(onSubmit, event) {
  event.preventDefault();

  let input = event.currentTarget.elements['newTodo']

  onSubmit(input.value);
  input.value = '';
}

<template>
  <form {{on 'submit' (fn handleSubmit  @onSubmit)}}>
    <input
      name="newTodo"
      class="new-todo"
      aria-label="What needs to be done?"
      placeholder="What needs to be done?"
      autofocus
    >
  </form>
</template>
