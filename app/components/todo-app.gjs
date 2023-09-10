import { state } from './state';
import Entry from './todo-app/entry';

<template>
  <section class='todoapp'>
    <h1>todos</h1>

    {{#let (state) as |s|}}
      <Entry @onSubmit={{s.add}} />

    {{/let}}
  </section>
</template>
