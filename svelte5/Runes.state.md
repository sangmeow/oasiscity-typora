# Runes

Runes are symbols to contorl the Svelte compiler which are the part of the language.

Runes have a `$` prefix and look like functions:

```javascript
let message = $state('hello');
```

## $state

The `$state` rune allows you to create reactive state, which means that your UI reacts when it changes.

```html
<script>
	let count = $state(0);
</script>

<button onclick={() => count++}>
	clicks: {count}
</button>
```

## Deep state

If `$state` is used with an array or a simple object, the result is a deeply reactive state proxy.

```javascript
let todos = $state([
	{
		done: false,
		text: 'add more todos'
	}
]);
```

You can also use `$state` in class fields.

```javascript
class Todo {
	done = $state(false);
	text = $state();

	constructor(text) {
		this.text = text;
	}

	reset() {
		this.text = '';
		this.done = false;
	}
}
```

In cases where you don’t want objects and arrays to be deeply reactive you can use `$state.raw`.

```javascript
let person = $state.raw({
	name: 'Heraclitus',
	age: 49
});

// this will have no effect
person.age += 1;

// this will work, because we're creating a new person
person = {
	name: 'Heraclitus',
	age: 50
};
```