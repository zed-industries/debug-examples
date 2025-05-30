const { add, multiply } = require("./math");

describe("Math utilities", () => {
  describe("add function", () => {
    test("adds positive numbers correctly", () => {
      const a = 1;
      const b = ["foo", "bar"];
      expect(add(2, 3)).toBe(5);
      expect(add(10, 15)).toBe(25);
    });

    test("handles negative numbers", () => {
      expect(add(-5, 3)).toBe(-2);
      expect(add(-10, -20)).toBe(-30);
    });

    test("handles zero", () => {
      expect(add(0, 5)).toBe(5);
      expect(add(7, 0)).toBe(7);
      expect(add(0, 0)).toBe(0);
    });

    test("handles decimal numbers", () => {
      expect(add(1.5, 2.3)).toBeCloseTo(3.8);
      expect(add(0.1, 0.2)).toBeCloseTo(0.3);
    });
  });

  describe("multiply function", () => {
    test("multiplies positive numbers correctly", () => {
      expect(multiply(3, 4)).toBe(12);
      expect(multiply(7, 8)).toBe(56);
    });

    test("handles negative numbers", () => {
      expect(multiply(-3, 4)).toBe(-12);
      expect(multiply(-5, -6)).toBe(30);
    });

    test("handles zero multiplication", () => {
      expect(multiply(0, 10)).toBe(0);
      expect(multiply(15, 0)).toBe(0);
    });

    test("handles decimal multiplication", () => {
      expect(multiply(2.5, 4)).toBe(10);
      expect(multiply(1.5, 1.5)).toBeCloseTo(2.25);
    });
  });
});
