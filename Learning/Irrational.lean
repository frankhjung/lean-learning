import Mathlib

/-!

`import Mathlib`

The import pulls in the full `Mathlib` library, which supplies `Nat.prime_two`, `dvd_of_dvd_pow`, `Nat.dvd_gcd`, and `Nat.Coprime.gcd_eq_one`.

The theorem signature takes two natural numbers a b and a proof h_coprime that their gcd is 1. The goal `a ^ 2 ≠ 2 * b ^ 2` captures the irrationality claim: if `√2 = a/b` in lowest terms, then `a² = 2b²`, and the theorem says no such coprime pair exists.

## Proof by Contradiction

`intro heq`

`≠` unfolds to = `→` False. intro heq introduces the assumption `heq : a ^ 2 = 2 * b ^ 2`, leaving False as the new goal. Everything that follows derives the contradiction.

## 2 divides a

`have ha : 2 ∣ a := Nat.prime_two.dvd_of_dvd_pow ⟨b ^ 2, heq⟩`

`⟨b ^ 2, heq⟩` constructs the proof `2 ∣ a ^ 2` as an anonymous existential: the witness is `b ^ 2` and heq is the proof that `a ^ 2 = 2 * b ^ 2`. This works because Lean already knows the expected type from `dvd_of_dvd_pow`, so it can elaborate the constructor.
`Nat.prime_two.dvd_of_dvd_pow` is Euclid's lemma specialised to `p = 2`: if a prime divides `n^k` then it divides `n`. Applied here it gives `ha : 2 ∣ a`.

## Substitute a = 2k

`obtain ⟨k, rfl⟩ := ha`

Destructs `ha : ∃ k, a = 2 * k`. The `rfl` pattern (rather than a name) triggers an immediate in-place substitution: every occurrence of `a` in the goal and all hypotheses becomes `2 * k`. After this line `heq reads (2 * k) ^ 2 = 2 * b ^ 2`.

## 2 divides b²

`have hb_sq : 2 ∣ b ^ 2 := ⟨k ^ 2, by nlinarith⟩`

Constructs `2 ∣ b ^ 2` as an existential: the witness is `k ^ 2` and the obligation is `b ^ 2 = 2 * k ^ 2`. `nlinarith` discharges this by expanding `(2 * k) ^ 2 = 4 * k ^ 2 = 2 * b ^ 2` from `heq` and dividing through.
The explicit type annotation is load-bearing — without `hb_sq : 2 ∣ b ^ 2`, the elaborator has no anchor to determine what `⟨k ^ 2, ...⟩` inhabits, and the `nlinarith` subgoal cannot be typed. This was the bug in the earlier version.

## 2 divides b

`have hb : 2 ∣ b := Nat.prime_two.dvd_of_dvd_pow hb_sq`

Euclid's lemma again, now for `b`: since `2` is prime and `2 ∣ b ^ 2`, we get `hb : 2 ∣ b`. Here `hb_sq` is already a correctly typed term, so no anonymous constructor is needed.

## Contradiction

`exact absurd (h_coprime.gcd_eq_one ▸ Nat.dvd_gcd ⟨k, rfl⟩ hb) (by decide)`

Unpacking inside-out:

- `⟨k, rfl⟩ : 2 ∣ (2 * k)` — witnesses divisibility of `a = 2 * k` by `2`, trivially via `rfl`.
- `Nat.dvd_gcd ⟨k, rfl⟩ hb : 2 ∣ (2 * k).gcd b` — if `d ∣ m` and `d ∣ n` then `d ∣ gcd(m, n)`. Applied with `d = 2`, `m = 2 * k`, `n = b`.
- `h_coprime.gcd_eq_one` extracts `(2 * k).gcd b = 1` from the coprimality hypothesis.
- `▸` rewrites with that equation inside the expression, transforming `2 ∣ gcd(a, b)` into `2 ∣ 1`.
- `by decide` proves `¬ (2 ∣ 1)` by kernel-level computation — it's a closed decidable proposition.
- `absurd : α → ¬α → β` takes `2 ∣ 1` and `¬ (2 ∣ 1)` and produces `False`, closing the goal.

-/


theorem sqrt_two_irrational (a b : ℕ) (h_coprime : a.Coprime b) : a ^ 2 ≠ 2 * b ^ 2 := by
  intro heq
  have ha : 2 ∣ a := Nat.prime_two.dvd_of_dvd_pow ⟨b ^ 2, heq⟩
  obtain ⟨k, rfl⟩ := ha
  have hb_sq : 2 ∣ b ^ 2 := ⟨k ^ 2, by nlinarith⟩
  have hb : 2 ∣ b := Nat.prime_two.dvd_of_dvd_pow hb_sq
  exact absurd (h_coprime.gcd_eq_one ▸ Nat.dvd_gcd ⟨k, rfl⟩ hb) (by decide)
