struct Glass {
  var capacity: Int
  var floz: Int

  init?(capacity : Int) {
    if (capacity < 1) {
      return nil
    }
    self.capacity = capacity
    self.floz = capacity
  }

  private func decfloz(amount: Int) -> Glass {
    if self.floz == 0 {
      return self
    }
    let actualAmount = min(amount, self.floz)
    var glass = Glass(capacity: capacity)!
    glass.floz = self.floz - actualAmount
    return glass
  }

  func drink() -> Glass {
    return decfloz(amount: 1)
  }

  func quaff() -> Glass {
    return decfloz(amount: 4)
  }

  func down() -> Glass {
    return decfloz(amount: self.capacity)
  }

  func fill() -> Glass? {
    if self.floz > 0 {
      return nil
    }
    return Glass(capacity: capacity)!
  }
}

func pint() -> Glass {
  return Glass(capacity: 20)!
}

func halfpint() -> Glass {
  return Glass(capacity: 10)!
}

func jug() -> Glass {
  return Glass(capacity: 60)!
}
