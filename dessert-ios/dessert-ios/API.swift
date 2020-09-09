// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct PaginationQueryInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - includeCount: Return the total number of elements
  ///   - pageNumber: Current page
  ///   - pageSize: Size of the page, max size: 50
  public init(includeCount: Bool, pageNumber: Int, pageSize: Int) {
    graphQLMap = ["includeCount": includeCount, "pageNumber": pageNumber, "pageSize": pageSize]
  }

  /// Return the total number of elements
  public var includeCount: Bool {
    get {
      return graphQLMap["includeCount"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "includeCount")
    }
  }

  /// Current page
  public var pageNumber: Int {
    get {
      return graphQLMap["pageNumber"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pageNumber")
    }
  }

  /// Size of the page, max size: 50
  public var pageSize: Int {
    get {
      return graphQLMap["pageSize"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pageSize")
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation login($email: String!, $password: String!, $remember: Boolean!) {
      login(email: $email, password: $password, remember: $remember) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "login"

  public var email: String
  public var password: String
  public var remember: Bool

  public init(email: String, password: String, remember: Bool) {
    self.email = email
    self.password = password
    self.remember = remember
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password, "remember": remember]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password"), "remember": GraphQLVariable("remember")], type: .nonNull(.object(Login.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Account"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int) {
        self.init(unsafeResultMap: ["__typename": "Account", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class LogoutMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation logout {
      logout
    }
    """

  public let operationName: String = "logout"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("logout", type: .nonNull(.scalar(Bool.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(logout: Bool) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "logout": logout])
    }

    public var logout: Bool {
      get {
        return resultMap["logout"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "logout")
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query search($query: String!, $pagination: PaginationQueryInput!) {
      search(query: $query, pagination: $pagination) {
        __typename
        pageNumber
        pageSize
        result {
          __typename
          id
          name
          author {
            __typename
            nickname
          }
          isCore
          publishedDateTime
          tags {
            __typename
            name
          }
          githubLink
          description
        }
        totalPages
        totalRecords
      }
    }
    """

  public let operationName: String = "search"

  public var query: String
  public var pagination: PaginationQueryInput

  public init(query: String, pagination: PaginationQueryInput) {
    self.query = query
    self.pagination = pagination
  }

  public var variables: GraphQLMap? {
    return ["query": query, "pagination": pagination]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["query": GraphQLVariable("query"), "pagination": GraphQLVariable("pagination")], type: .nonNull(.object(Search.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaginatedResultOfModule"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("pageNumber", type: .nonNull(.scalar(Int.self))),
        GraphQLField("pageSize", type: .nonNull(.scalar(Int.self))),
        GraphQLField("result", type: .list(.object(Result.selections))),
        GraphQLField("totalPages", type: .scalar(Int.self)),
        GraphQLField("totalRecords", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageNumber: Int, pageSize: Int, result: [Result?]? = nil, totalPages: Int? = nil, totalRecords: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "PaginatedResultOfModule", "pageNumber": pageNumber, "pageSize": pageSize, "result": result.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, "totalPages": totalPages, "totalRecords": totalRecords])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pageNumber: Int {
        get {
          return resultMap["pageNumber"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "pageNumber")
        }
      }

      public var pageSize: Int {
        get {
          return resultMap["pageSize"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "pageSize")
        }
      }

      public var result: [Result?]? {
        get {
          return (resultMap["result"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "result")
        }
      }

      public var totalPages: Int? {
        get {
          return resultMap["totalPages"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalPages")
        }
      }

      public var totalRecords: Int? {
        get {
          return resultMap["totalRecords"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalRecords")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Module"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
          GraphQLField("isCore", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("publishedDateTime", type: .nonNull(.scalar(String.self))),
          GraphQLField("tags", type: .nonNull(.list(.nonNull(.object(Tag.selections))))),
          GraphQLField("githubLink", type: .scalar(String.self)),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String, author: Author, isCore: Bool, publishedDateTime: String, tags: [Tag], githubLink: String? = nil, description: String) {
          self.init(unsafeResultMap: ["__typename": "Module", "id": id, "name": name, "author": author.resultMap, "isCore": isCore, "publishedDateTime": publishedDateTime, "tags": tags.map { (value: Tag) -> ResultMap in value.resultMap }, "githubLink": githubLink, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var author: Author {
          get {
            return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "author")
          }
        }

        public var isCore: Bool {
          get {
            return resultMap["isCore"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isCore")
          }
        }

        public var publishedDateTime: String {
          get {
            return resultMap["publishedDateTime"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "publishedDateTime")
          }
        }

        public var tags: [Tag] {
          get {
            return (resultMap["tags"] as! [ResultMap]).map { (value: ResultMap) -> Tag in Tag(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Tag) -> ResultMap in value.resultMap }, forKey: "tags")
          }
        }

        public var githubLink: String? {
          get {
            return resultMap["githubLink"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "githubLink")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public struct Author: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Account"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nickname", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nickname: String) {
            self.init(unsafeResultMap: ["__typename": "Account", "nickname": nickname])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nickname: String {
            get {
              return resultMap["nickname"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "nickname")
            }
          }
        }

        public struct Tag: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ModuleTag"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "ModuleTag", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getUser($author: Int!, $pagination: PaginationQueryInput!) {
      user(id: $author) {
        __typename
        id
        nickname
        profilePicUrl
        tokens {
          __typename
          id
          token
          description
        }
        modules(pagination: $pagination) {
          __typename
          totalRecords
          result {
            __typename
            id
            name
            description
            publishedDateTime
            author {
              __typename
              id
              nickname
              profilePicUrl
            }
            tags {
              __typename
              id
              name
            }
          }
        }
      }
    }
    """

  public let operationName: String = "getUser"

  public var author: Int
  public var pagination: PaginationQueryInput

  public init(author: Int, pagination: PaginationQueryInput) {
    self.author = author
    self.pagination = pagination
  }

  public var variables: GraphQLMap? {
    return ["author": author, "pagination": pagination]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["id": GraphQLVariable("author")], type: .nonNull(.object(User.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Account"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("nickname", type: .nonNull(.scalar(String.self))),
        GraphQLField("profilePicUrl", type: .nonNull(.scalar(String.self))),
        GraphQLField("tokens", type: .nonNull(.list(.nonNull(.object(Token.selections))))),
        GraphQLField("modules", arguments: ["pagination": GraphQLVariable("pagination")], type: .nonNull(.object(Module.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, nickname: String, profilePicUrl: String, tokens: [Token], modules: Module) {
        self.init(unsafeResultMap: ["__typename": "Account", "id": id, "nickname": nickname, "profilePicUrl": profilePicUrl, "tokens": tokens.map { (value: Token) -> ResultMap in value.resultMap }, "modules": modules.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var nickname: String {
        get {
          return resultMap["nickname"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickname")
        }
      }

      public var profilePicUrl: String {
        get {
          return resultMap["profilePicUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePicUrl")
        }
      }

      public var tokens: [Token] {
        get {
          return (resultMap["tokens"] as! [ResultMap]).map { (value: ResultMap) -> Token in Token(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Token) -> ResultMap in value.resultMap }, forKey: "tokens")
        }
      }

      public var modules: Module {
        get {
          return Module(unsafeResultMap: resultMap["modules"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "modules")
        }
      }

      public struct Token: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AuthToken"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, token: String, description: String) {
          self.init(unsafeResultMap: ["__typename": "AuthToken", "id": id, "token": token, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }

      public struct Module: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaginatedResultOfModule"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalRecords", type: .scalar(Int.self)),
          GraphQLField("result", type: .list(.object(Result.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalRecords: Int? = nil, result: [Result?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "PaginatedResultOfModule", "totalRecords": totalRecords, "result": result.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var totalRecords: Int? {
          get {
            return resultMap["totalRecords"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalRecords")
          }
        }

        public var result: [Result?]? {
          get {
            return (resultMap["result"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "result")
          }
        }

        public struct Result: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Module"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("publishedDateTime", type: .nonNull(.scalar(String.self))),
            GraphQLField("author", type: .nonNull(.object(Author.selections))),
            GraphQLField("tags", type: .nonNull(.list(.nonNull(.object(Tag.selections))))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, name: String, description: String, publishedDateTime: String, author: Author, tags: [Tag]) {
            self.init(unsafeResultMap: ["__typename": "Module", "id": id, "name": name, "description": description, "publishedDateTime": publishedDateTime, "author": author.resultMap, "tags": tags.map { (value: Tag) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public var publishedDateTime: String {
            get {
              return resultMap["publishedDateTime"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "publishedDateTime")
            }
          }

          public var author: Author {
            get {
              return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "author")
            }
          }

          public var tags: [Tag] {
            get {
              return (resultMap["tags"] as! [ResultMap]).map { (value: ResultMap) -> Tag in Tag(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Tag) -> ResultMap in value.resultMap }, forKey: "tags")
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Account"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("nickname", type: .nonNull(.scalar(String.self))),
              GraphQLField("profilePicUrl", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, nickname: String, profilePicUrl: String) {
              self.init(unsafeResultMap: ["__typename": "Account", "id": id, "nickname": nickname, "profilePicUrl": profilePicUrl])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var nickname: String {
              get {
                return resultMap["nickname"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "nickname")
              }
            }

            public var profilePicUrl: String {
              get {
                return resultMap["profilePicUrl"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "profilePicUrl")
              }
            }
          }

          public struct Tag: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ModuleTag"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String) {
              self.init(unsafeResultMap: ["__typename": "ModuleTag", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }
    }
  }
}
