//
//  BaseRepoModel.swift
//  SampleMVC
//
//  Created by DURGA RAO on 27/03/20.
//  Copyright © 2020 DURGA RAO. All rights reserved.
//

import Foundation

struct BaseRepoModel: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Item: Codable {
    var id: Int
    var nodeID, name, fullName: String
    var itemPrivate: Bool
    var owner: Owner
    var htmlURL: String?
    var description: String?
    var fork: Bool
    var url: String?
    var forksURL: String?
    var keysURL, collaboratorsURL: String?
    var teamsURL, hooksURL: String?
    var issueEventsURL: String?
    var eventsURL: String?
    var assigneesURL, branchesURL: String?
    var tagsURL: String?
    var blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    var statusesURL: String?
    var languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    var subscriptionURL: String?
    var commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    var contentsURL, compareURL: String?
    var mergesURL: String?
    var archiveURL: String?
    var downloadsURL: String?
    var issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    var labelsURL, releasesURL: String?
    var deploymentsURL: String?
    var createdAt, updatedAt, pushedAt: String?
    var gitURL, sshURL: String?
    var cloneURL: String?
    var svnURL: String?
    var homepage: String?
    var size, stargazersCount, watchersCount: Int
    var language: String?
    var hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    var hasPages: Bool
    var forksCount: Int
    var mirrorURL: JSONNull?
    var archived: Bool
    var openIssuesCount: Int
    var license: License?
    var forks, openIssues, watchers: Int
    var defaultBranch: String?
    var score: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case description, fork, url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived
        case openIssuesCount = "open_issues_count"
        case license, forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        case score
    }
}

enum DefaultBranch: String, Codable {
    case develop = "develop"
    case master = "master"
}

enum Language: String, Codable {
    case c = "C#"
    case javaScript = "JavaScript"
    case objectiveC = "Objective-C"
    case swift = "Swift"
    case typeScript = "TypeScript"
}

struct License: Codable {
    let key: String?
    let name: String?
    let spdxID: String?
    let url: String?
    let nodeID: String?
    
    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}

//enum Key: String, Codable {
//    case apache20 = "apache-2.0"
//    case bsd2Clause = "bsd-2-clause"
//    case mit = "mit"
//    case other = "other"
//}

enum Name: String, Codable {
    case apacheLicense20 = "Apache License 2.0"
    case bsd2ClauseSimplifiedLicense = "BSD 2-Clause \"Simplified\" License"
    case mitLicense = "MIT License"
    case other = "Other"
}

enum NodeID: String, Codable {
    case mDc6TGljZW5ZZTA = "MDc6TGljZW5zZTA="
    case mDc6TGljZW5ZZTEz = "MDc6TGljZW5zZTEz"
    case mDc6TGljZW5ZZTI = "MDc6TGljZW5zZTI="
    case mDc6TGljZW5ZZTQ = "MDc6TGljZW5zZTQ="
}

enum SpdxID: String, Codable {
    case apache20 = "Apache-2.0"
    case bsd2Clause = "BSD-2-Clause"
    case mit = "MIT"
    case noassertion = "NOASSERTION"
}

struct Owner: Codable {
    let login: String?
    let id: Int
    let nodeID: String?
    var avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

//enum TypeEnum: String, Codable {
//    case organization = "Organization"
//    case user = "User"
//}
// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

