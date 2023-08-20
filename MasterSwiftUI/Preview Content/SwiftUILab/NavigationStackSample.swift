//
//  NavigationStackSample.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 14/08/23.
//

import SwiftUI


struct ExampleView: View {
    @StateObject var db = MovieDB()
    
    var body: some View {
        NavigationStack {
            RootStackView()
                .navigationDestination(for: Genre.self) { GenreStackView(genre: $0) }
                .navigationDestination(for: Movie.self) { MovieStackView(movie: $0) }
                .navigationDestination(for: CastMember.self) { CastMemberStackView(castMember: $0) }
                .navigationDestination(for: Director.self) { DirectorStackView(director: $0) }
                .navigationBarTitleDisplayMode(.large)

        }
        .environmentObject(db)
    }
}

// A list of genres
struct RootStackView: View {
    @EnvironmentObject var db: MovieDB
    
    var body: some View {
        List(Genre.allCases, id: \.self) { genre in
            NavigationLink(genre.rawValue, value: genre)
        }
        .navigationTitle("Genres")
    }
}

// A list of movies in a genre
struct GenreStackView: View {
    @EnvironmentObject var db: MovieDB
    let genre: Genre
    
    var body: some View {
        List(db.movies(for: genre)) { movie in
            NavigationLink(movie.name, value: movie)
                .isDetailLink(false)
        }
        .navigationTitle(genre.rawValue)

    }
}

// movie details
struct MovieStackView: View {
    @EnvironmentObject var db: MovieDB
    let movie: Movie
    @State private var isGenreLinkActive = false
    var body: some View {
        List {
            Section("Details") {
                let director = db.director(for: movie)
                
                LabeledContent("Year", value: "\(movie.year)")
                LabeledContent("Runtime", value: "\(movie.runtime)")

                NavigationLink(value: movie.genre) {
                    LabeledContent("Genre", value: movie.genre.rawValue)
                }
                NavigationLink(value: director) {
                    LabeledContent("Director", value: director.name)
                }
                
            }
            
            Section("Cast") {
                ForEach(db.cast(for: movie)) { castMember in
                    NavigationLink(castMember.name, value: castMember)
                }
            }
        }
        .navigationTitle(movie.name)
    }
}

// cast member details
struct CastMemberStackView: View {
    @EnvironmentObject var db: MovieDB
    let castMember: CastMember
    
    var body: some View {
        List {
            Section("Details") {
                LabeledContent("Year", value: "\(castMember.year)")
                LabeledContent("Country", value: "\(castMember.country)")
            }
            
            Section("Movies") {
                ForEach(db.movies(for: castMember)) { movie in
                    NavigationLink(movie.name, value: movie)
                }
            }
        }
        .navigationTitle(castMember.name)
    }
}

// director details
struct DirectorStackView: View {
    @EnvironmentObject var db: MovieDB
    let director: Director
    
    var body: some View {
        List {
            Section("Details") {
                LabeledContent("Year", value: "\(director.year)")
            }
            
            Section("Movies") {
                ForEach(db.movies(for: director)) { movie in
                    NavigationLink(movie.name, value: movie)
                }
            }
        }
        .navigationTitle(director.name)
    }
}

enum Genre: String, CaseIterable, Hashable {
    case action = "Action"
    case drama = "Drama"
    case scifi = "Sci-Fi"
}

struct Movie: Identifiable, Hashable {
    let id: Int
    let name: String
    let year: Int
    let runtime: Int
    let genre: Genre
    
    let cast: [Int]
    let director: Int
}

struct CastMember: Identifiable, Hashable {
    let id: Int
    let name: String
    let year: Int
    let country: String
}

struct Director: Identifiable, Hashable {
    let id: Int
    let name: String
    let year: Int
}

class MovieDB: ObservableObject {
    let movies = [
        Movie(id: 1, name: "Gattaca", year: 1997, runtime: 106, genre: .scifi, cast: [1, 2, 3], director: 1),
        Movie(id: 2, name: "Contact", year: 1997, runtime: 150, genre: .scifi, cast: [4, 5], director: 2),
        Movie(id: 3, name: "Back to the Future", year: 1985, runtime: 116, genre: .scifi, cast: [6, 7], director: 2),
        Movie(id: 4, name: "Back to the Future Part II", year: 1989, runtime: 108, genre: .scifi, cast: [6, 7], director: 2),
        Movie(id: 5, name: "Back to the Future Part III", year: 1990, runtime: 118, genre: .scifi, cast: [6, 7], director: 2),
        Movie(id: 6, name: "The Talented Mr. Ripley", year: 1999, runtime: 139, genre: .drama, cast: [2, 8, 9], director: 3),
        Movie(id: 7, name: "In Time", year: 2011, runtime: 169, genre: .scifi, cast: [10, 11], director: 1),
        Movie(id: 8, name: "Cold Mountain", year: 2003, runtime: 154, genre: .drama, cast: [2, 12, 13], director: 3),
        Movie(id: 9, name: "Good Will Hunting", year: 1997, runtime: 126, genre: .drama, cast: [8, 14, 15], director: 4),
        Movie(id: 10, name: "The Adjustment Bureau", year: 1997, runtime: 106, genre: .action, cast: [8, 16], director: 5),
        Movie(id: 11, name: "The Gentlemen", year: 2019, runtime: 113, genre: .action, cast: [5, 17], director: 6),
    ]
    
    let directors = [
        Director(id: 1, name: "Andrew Niccol", year: 1964),
        Director(id: 2, name: "Robert Zemeckis", year: 1951),
        Director(id: 3, name: "Anthony Minghella", year: 1954),
        Director(id: 4, name: "Gus Van Sant", year: 1952),
        Director(id: 5, name: "George Nolfi", year: 1968),
        Director(id: 6, name: "Guy Ritchie", year: 1968),
    ]
    
    let castMembers = [
        CastMember(id: 1, name: "Ethan Hawke", year: 1970, country: "USA"),
        CastMember(id: 2, name: "Jude Law", year: 1972, country: "England"),
        CastMember(id: 3, name: "Uma Thurman", year: 1970, country: "USA"),
        CastMember(id: 4, name: "Jodie Foster", year: 1962, country: "USA"),
        CastMember(id: 5, name: "Matthew McConaughey", year: 1969, country: "USA"),
        CastMember(id: 6, name: "Michael J. Fox", year: 1961, country: "Canada"),
        CastMember(id: 7, name: "Christopher Lloyd", year: 1938, country: "USA"),
        CastMember(id: 8, name: "Matt Damon", year: 1970, country: "USA"),
        CastMember(id: 9, name: "Gwyneth Paltrow", year: 1972, country: "USA"),
        CastMember(id: 10, name: "Justin Timberlake", year: 1981, country: "USA"),
        CastMember(id: 11, name: "Amanda Seyfried", year: 1985, country: "USA"),
        CastMember(id: 12, name: "Nicole Kidman", year: 1967, country: "USA"),
        CastMember(id: 13, name: "Renée Zellweger", year: 1969, country: "USA"),
        CastMember(id: 14, name: "Ben Affleck", year: 1972, country: "USA"),
        CastMember(id: 15, name: "Robin Williams", year: 1951, country: "USA"),
        CastMember(id: 16, name: "Emily Blunt", year: 1951, country: "England"),
        CastMember(id: 17, name: "Charlie Hunnam", year: 1980, country: "England"),
    ]
    
    func movies(for genre: Genre) -> [Movie] {
        movies.filter({ $0.genre == genre })
    }
    
    func director(for movie: Movie) -> Director {
        directors.first(where: { $0.id == movie.director })!
    }
    
    func cast(for movie: Movie) -> [CastMember] {
        movie.cast.map { castMemberId in castMembers.first(where: { $0.id == castMemberId })! }
    }
    
    func movies(for castMember: CastMember) -> [Movie] {
        movies.filter { $0.cast.contains(castMember.id) }
    }
    
    func movies(for director: Director) -> [Movie] {
        movies.filter { $0.director == director.id }
    }
}



struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
