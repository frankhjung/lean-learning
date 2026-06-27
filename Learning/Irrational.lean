import Mathlib

theorem sqrt_two_irrational (a b : ℕ) (h_coprime : a.Coprime b) : a^2 ≠ 2 * b^2 := by
  -- Assume the opposite: a^2 = 2 * b^2
  intro h

  -- Step 1: Prove that 2 divides a^2, and therefore 2 divides a
  have h_a2_even : 2 ∣ a^2 := by
    exact ⟨b^2, by rw [h, mul_comm]⟩
  have h_a_even : 2 ∣ a := Nat.Prime.dvd_of_dvd_pow Nat.prime_two h_a2_even

  -- Since 2 divides a, we can write a = 2 * k for some natural number k
  obtain ⟨k, rfl⟩ := h_a_even

  -- Step 2: Substitute a = 2 * k into our original equation to show 2 divides b^2
  have h_b2_even : 2 ∣ b^2 := by
    use k^2
    -- We have (2 * k)^2 = 2 * b^2, which means 4 * k^2 = 2 * b^2.
    -- We can cancel a 2 from both sides to get b^2 = 2 * k^2.
    have h_cancel : 2 * (2 * k^2) = 2 * b^2 := by
      calc 2 * (2 * k^2) = (2 * k)^2 := by ring
      _                  = 2 * b^2   := h
    exact Nat.eq_of_mul_eq_mul_left (by decide) h_cancel |>.symm

  -- Step 3: Since 2 divides b^2, 2 must also divide b
  have h_b_even : 2 ∣ b := Nat.Prime.dvd_of_dvd_pow Nat.prime_two h_b2_even

  -- Step 4: Contradiction! If 2 divides both a and b, they are not coprime
  have h_2_dvd_gcd : 2 ∣ (2 * k).gcd b := Nat.dvd_gcd ⟨k, rfl⟩ h_b_even

  -- But we assumed a and b are coprime, meaning their greatest common divisor is 1
  rw [Nat.Coprime.gcd_eq_one h_coprime] at h_2_dvd_gcd

  -- This leaves us with the false statement that 2 divides 1.
  -- Lean's `decide` tactic can evaluate this contradiction and close the goal.
  revert h_2_dvd_gcd
  decide
