//
//  main.swift
//  class5
//
//  Created by Kanat on 14/2/22.
//

import Darwin
var zero :Int = 0
var bossName = "Boss"
var bossHealth: Int = 800
var bossDamage: Int = 70
var heroesNames: [String] = ["Warrior", "Wizard", "Archer" , "Healer" , "Tank"]
var heroesHealth: [Int] = [150, 250, 250 , 200, 200]
var heroesDamage: [Int] = [60, 90, 40 , 0 , 0]
var tankDefence = 0
var chance = 0
var critic = Int.random(in: 10...50)
var eliteWarrior = 0

func eliteDamage() {
    if eliteWarrior == 5 {
        print("Boss stunned")
    } else {
        bossHit()
        
    }
    
}


 var random = Int.random(in: 50..<90)
func bossCrit() {
    for item in  0..<heroesHealth.count {
    if bossHealth > 200 && bossHealth < 100  {
        heroesHealth[item] = heroesHealth[item] - random
        break
   
    }
  }
}
func tankSave() {
    for item in 0..<heroesHealth.count{

        if heroesHealth[item] >= 200 {
          var bossDamage2 = bossDamage / 2
            heroesHealth[item] = heroesHealth[item] + bossDamage2
            
        }else {
            heroesHealth[4] == 0
            break
        }
        
    }
}
func heal() {
    for i in 0..<3 {
        heroesHealth[i] = heroesHealth[i] + 20
        if heroesHealth[3] <= 0 {
            break
        }
        if heroesHealth[i] <= 0 {
            heroesHealth[i] = 0
            
        }
    }
}
func revive() {
    for (index , value) in heroesHealth.enumerated() {
        if heroesHealth[index] <= 0{
                heroesHealth[index] = 0

        }
    }
    
}
func bossHit() {
    tankDefence = Int.random(in: 1...10)
    chance = Int.random(in: 1...4)
    if chance == 3 {
     bossCrit()
    }
   
    }
    for i in 0..<heroesHealth.count {
        
        heroesHealth[i] = heroesHealth[i] - bossDamage
        if heroesHealth[i] <= 0 {
            heroesHealth[i] = 0
        }
        if heroesHealth[i] == heroesHealth[4]{
            heroesHealth[i] = heroesHealth[i] - tankDefence * 5
    }

}

func heroesHit() {
    for i in 0..<heroesDamage.count{
        
        bossHealth = bossHealth - heroesDamage[i]
        if bossHealth <= 0{
            bossHealth = 0
        }
    }
}

while true {
    
    if heroesHealth[0]  <= 0 && heroesHealth[1] <= 0 && heroesHealth[2] <= 0 && heroesHealth[3] <= 0 && heroesHealth[4] <= 0{
        print("Босс победил, game over!")
        break
    } else if bossHealth <= 0{
        print("Герои победили, game over!")
        break
    
    
    
    }
    round()
    
}


func round() {
    
    eliteWarrior = Int.random(in: 1...10)
    print("eliteDamage()" + "\(heroesHealth)")
    revive()
    print("-------------------")
    print(bossName + " атакует!")
    print("-------------------")
    tankSave()
    print("Танк блкирует урон" + "\(heroesHealth)")
    print("-------------------")
    print("Здоровье героев: " + "\(heroesHealth)")
    print("-------------------")
    heal()
    revive()
    print("Исцеление" + "\(heroesHealth)")
    print("-------------------")
    heroesHit()
    print("Герои атакуют!")
    print("Здоровье босса: " + "\(bossHealth)")
    print("-------------------")
    bossCrit()
    print("Крит да или нет " + "\(heroesHealth)" )
    revive()
}

