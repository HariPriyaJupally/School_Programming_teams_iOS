//
//  SchoolTeamContest.swift
//  School Programming Teams
//
//  Created by Jupally,Hari Priya on 3/13/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import Foundation
class Team:Equatable{
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name && lhs.students == rhs.students
    }
    
    var name: String
    var students: [String]
    
    init(name: String, students: [String]) {
        self.name = name
        self.students = students
    }
    
}

class School: Equatable{
    static func == (lhs: School, rhs: School) -> Bool {
        return lhs.name == rhs.name && lhs.coach == rhs.coach && lhs.teams == rhs.teams
    }
    
    var name: String
    var coach: String
    var teams: [Team]
    
    init(name: String, coach: String) {
        self.name = name
        self.coach = coach
        self.teams = []
    }
    
    func addTeam(name: String, students: [String]) {
        let team = Team(name: name, students: students)
        teams.append(team)
    }
}

class Schools{
    private var schools:[School]
    
    static var shared = Schools()
    
    init(schools: [School]) {
        self.schools = schools
    }
    convenience init() {
        self.init(schools: [])
    }
    
    func numSchools() -> Int {
        return schools.count
    }
    
    subscript(index:Int) -> School {
        return schools[index]
    }
    
    func add(school: School) {
        schools.append(school)
    }
    
    func delete(school: School) {
        for i in 0..<schools.count {
            if schools[i] == school {
                schools.remove(at: i)
                break
            }
        }
    }
}
