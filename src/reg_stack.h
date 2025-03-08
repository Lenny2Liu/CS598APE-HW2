#pragma once

namespace genetic {

/**
 * @brief A fixed capacity stack on device currently used for AST evaluation
 *
 * The idea is to use only the registers to store the elements of the stack,
 * thereby achieving the best performance.
 *
 * @tparam DataT   data type of the stack elements
 * @tparam MaxSize max capacity of the stack
 */
template <typename DataT, int MaxSize> struct stack {
  explicit stack() : elements_(0) {}

  bool empty() const { return (elements_ == 0); }
  int size()  const { return elements_; }
  bool full() const { return (elements_ == MaxSize); }

  void push(DataT val) {
    if (elements_ < MaxSize) {
      regs_[elements_++] = val;
    }
  }

  DataT pop() {
    if (elements_ > 0) {
      return regs_[--elements_];
    }
    return DataT(0);
  }

private:
  int elements_;
  DataT regs_[MaxSize];
};

} // namespace genetic
