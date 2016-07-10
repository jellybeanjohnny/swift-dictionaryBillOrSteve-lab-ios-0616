//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var factLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	
	@IBOutlet weak var steveButton: UIButton!
	@IBOutlet weak var billButton: UIButton!
	
	var facts : [String: [String]] = [:]
	var currentFact: String?
	var currentPerson: String?
	
	var currentScore = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createFacts()
		showFact()
	}
	
	func randomNumberFromZeroTo(number: Int) -> Int {
		return Int(arc4random_uniform(UInt32(number)))
	}
	
	func randomPerson() -> String {
		let randomNumber = arc4random_uniform(2)
		
		if randomNumber == 0 {
			return "Steve Jobs"
		} else {
			return "Bill Gates"
		}
	}
	
	func createFacts() {
		let steveFacts = [
			"He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
			"Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
			"He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
			"He was a pescetarian, meaning he ate no meat except for fish."
		]
		
		let billFacts = [
			"He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
			"He scored 1590 (out of 1600) on his SATs.",
			"His foundation spends more on global health each year than the United Nation's World Health Organization.",
			"The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
			"In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
		]
		
		facts = [
			"Steve Jobs" : steveFacts,
			"Bill Gates" : billFacts
		]
	}
	
	func getRandomFact() -> (fact: String, name: String)? {
		
		// Pick a random person
		let person = randomPerson()
		
		// Get the facts for this person
		guard let personFacts = facts[person] else { return nil }
		
		// Get a random fact for this person
	  let randomFact = personFacts[randomNumberFromZeroTo(personFacts.count - 1)]
		
		// Retrn the person and fact as a tuple
		return (randomFact, person)
	}
	
	func showFact() {
		// Get a random fact
		guard let randomFact = getRandomFact() else { return }
		
		currentFact = randomFact.fact
		currentPerson = randomFact.name
		
		factLabel.text = currentFact
	}
	
	
	@IBAction func steveButtonTapped(sender: AnyObject) {
		checkFact("Steve Jobs")
	}
	
	@IBAction func billButtonTapped(sender: AnyObject) {
		checkFact("Bill Gates")
	}
	
	func checkFact(guessedPerson: String) {
		if currentPerson == guessedPerson {
			currentScore += 1
			scoreLabel.text = "\(currentScore)"
		}
		showFact()
	}
	
}
