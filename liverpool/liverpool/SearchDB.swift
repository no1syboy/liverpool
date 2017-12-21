//
//  SearchDB.swift
//  liverpool
//
//  Created by Erick Cienfuegos on 12/20/17.
//  Copyright © 2017 Erick Cienfuegos. All rights reserved.
//

import Foundation
import SQLite

class SearchDB {
    
    fileprivate let search = Table("search")
    fileprivate let id = Expression<Int64>("id")
    
    private let name = Expression<String?>("name")
    
    static let instance = SearchDB()
    fileprivate let db: Connection?
    
    fileprivate init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/Stephencelis.sqlite3")
            createTable()
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }
    
    func createTable() {
        do {
            try db!.run(search.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addSearch(_ cname: String) -> Int64? {
        do {
            let insert = search.insert(name <- cname)
            let id = try db!.run(insert)
            print(["id": id])
            return id
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func addDummy() -> Int64? {
        do {
            let insert = search.insert(name <- "compu")
            let id = try db!.run(insert)
            print(["id": id])
            return id
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func getSearchs() -> [Search] {
        var searchs = [Search]()
        
        do {
            for search in try db!.prepare(self.search) {
                searchs.append(Search(
                    id: search[id],
                    name: search[name]!
                    )
                )
            }
        } catch {
            print("Select failed")
        }
        
        return searchs
    }
    
}

