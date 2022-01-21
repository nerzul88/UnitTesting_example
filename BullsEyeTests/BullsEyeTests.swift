/// Copyright (c) 2022 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest
//предоставляем юнит-тестам доступ к внутренним типам приложения
@testable import BullsEye

class BullsEyeTests: XCTestCase {
  //создаём плейсхолдер (объект, с которым тестовый кейс класса связан с тестированием) System Under Test(SUT)
  var sut: BullsEyeGame!
  
  override func setUpWithError() throws {
    //создаём приложение на уровне класса, чтобы все тесты в тестовом классе
    //могли получить доступ к свойствам и методам объекта SUT
    try super.setUpWithError()
    sut = BullsEyeGame()
  }
  
  override func tearDownWithError() throws {
    //чтобы каждый тест начинался с "чистого листа", освобождаем объект sut
    sut = nil
    try super.tearDownWithError()
  }
  
  func testScoreIsComputedWhenGuessIsHigherThanTarget() {
    //дано
    let guess = sut.targetValue + 5
    //когда
    sut.check(guess: guess)
    //тогда
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }
  
  func testScoreIsComputedWhenGuessIsLowerThanTarget() {
    //дано
    let guess = sut.targetValue - 5
    //когда
    sut.check(guess: guess)
    //тогда
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }
  
  //тест производительности
  func testScoreIsComputedPerformance() {
    measure(metrics: [
      //измеряет сколько времени прошло
      XCTClockMetric(),
      //отслеживает активность CPU, включая время CPU, циклы и количество инструкций
      XCTCPUMetric(),
      //сообщает вам, сколько данных тестируемый код записывает в хранилище
      XCTStorageMetric(),
      //отслеживает объем используемой физической памяти
      XCTMemoryMetric()
    ]) {
      sut.check(guess: 100)
    }
  }
  
}
