# MONAD

함수형 프로그래밍은 함수의 합성(파이프라인)을 통해서 프로그래밍을 이어나가는 순수 함수 형태의 패러다임이다.

함수형 프로그래밍은 성공적인 프로그래밍을 위해 부수 효과를 최대한 멀리하고 조합성을 강조하는 프로그래밍 패러다임이다. 함수형 프로그래밍이 부수 효과를 최대한 멀리하는 이유는 다음 두 가지를 위해서다. 하나는 오류를 줄이기 위해서고, 또 하나는 조합성 혹은 모듈화 수준을 높이기 위해서다. (…) 높은 모듈화 수준은 생산성을 높이고, 오류 없는 함수들의 조합은 프로그래밍 전체의 안정성을 높여 준다.

함수형 프로그래밍은 순수 함수와 선언형 프로그래밍의 토대 위에 함수 조합(function composition)과 모나드 조합(monadic composition)으로 코드를 설계하고 구현하는 기법입니다.

```javascript
[1, 2].map(a => a + 1).map(a => a - 1).forEach(a => console.log(a); // 1
[].map(a => a + 1).map(a => a - 1).forEach(a => console.log(a); // 2
```

`[1,2]` 배열은 모나드이고 이 모나드에 `map method`가 구현되어 있다.

`Promise`는 `future Monad` 이다

```javascript
Promise.resolve(e).then(e => e + 1).then(e => e - 1)
```

여기서 모나드는 `Promise.resolve(e)` 이 매서드의 결과로 리턴된 promise 객체가 모나드 라는 뜻이다.
`future Monad`라고 한 이유는 `Promise.resolve(e)` 이게 언제 끝날지 모르는데 미래에 언젠가 끝나고 리턴된 값을 `.then(e => e + 1)` 에서 잡아다가 연산을 해주겠다는 뜻이다.

```javascript

console.log('Functional Programming in TypeScript - Monad 1');
const box: number[] = [2];
const mapResult = box
  .map((x) => x + 3)
  .map((x) => x * 4)
  .map((x) => x / 5);
console.log(mapResult); // [4]

console.log('Functional Programming in TypeScript - Monad 2');
const box2: number[] = [2];
const mapResult2 = box2
  .map((x) => x + 3)
  .flatMap((x) => [x * 4, x ** 4])
  .map((x) => x / 5);
console.log(mapResult2); // [4,125]

console.log('Functional Programming in TypeScript - Monad Maybe 1');
// let x: number = 2;
//   x += 4;
//   x /= y; //. Error: y is not defined or 0
//   x *= 2;
// console.log(x);

import { Maybe } from './Maybe';
const safeDivivde = (x: number, y: number): Maybe<number | null> => {
  if (y === 0) {
    return Maybe.nothing();
  }
  return Maybe.just(x / y);
};
console.log(safeDivivde(4, 2).getOrElse(0)); // 2

const result = Maybe.just(2)
  .flatMap((x: number) => safeDivivde(x, 2))
  .flatMap((x: number) => safeDivivde(x, 0))
  .flatMap((x: number) => safeDivivde(x, 2))
  .getOrElse(0);
console.log(result); // 0
```

```javascript
export class Maybe<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  // Unit (or Return)
  static just<U>(value: U) {
    return new Maybe(value);
  }

  // Unit (or Return)
  static nothing() {
    return new Maybe(null);
  }
  
  isNothing() {
    return this.value === null || this.value === undefined;
  }

  // Functor
  map(fn: Function) {
    if (this.isNothing()) {
      return Maybe.nothing();
    }
    return Maybe.just(fn(this.value));
  }

  // Bind (or FlatMap)
  flatMap(fn: Function) {
    if (this.isNothing()) {
      return Maybe.nothing();
    }
    return fn(this.value);
  }

  getOrElse(defaultValue: any) {
    if (this.isNothing()) {
      return defaultValue;
    }
    return this.value;
  }
}
```

