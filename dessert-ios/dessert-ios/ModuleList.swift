//ModuleList.swift created on 29/06/2020.

import SwiftUI

import MarkdownView

class UIModuleRowController: UIViewController {
    
    var module: GetUserQuery.Data.User.Module.Result
    
    convenience init() {
        self.init(module: nil)
    }

    init(module: GetUserQuery.Data.User.Module.Result?) {
        self.module = module!
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Decoder failed")
    }
    
    func showMarkdown(url: String) {
        let mdView = MarkdownView()
        
        view.addSubview(mdView)
        mdView.translatesAutoresizingMaskIntoConstraints = false
        mdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mdView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let urlRaw = Helper.githubToRaw(link: url)
        let readMeLink = Helper.githubReadMe(link: urlRaw!)
        var markdown = try! String(contentsOf: URL(string: readMeLink)!, encoding: String.Encoding.utf8)
        markdown = Helper.stepUpToHTTPS(markdown: markdown)
        markdown = Helper.removeGIFs(markdown: markdown)
        mdView.load(markdown: markdown, enableImage: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMarkdown(url: module.githubLink!)
    }
}

struct UIModuleRowView: UIViewControllerRepresentable {
    var module: GetUserQuery.Data.User.Module.Result
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<UIModuleRowView>) -> UIModuleRowController {
        let moduleController = UIModuleRowController(module: module)
        return moduleController
    }

    func updateUIViewController(_ uiViewController: UIModuleRowController, context: UIViewControllerRepresentableContext<UIModuleRowView>) {
    }
}

struct ModuleRowHeaderView: View {
    var module: GetUserQuery.Data.User.Module.Result
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(module.name).font(.largeTitle)
            if module.isCore {
                Text(String("core")).foregroundColor(Color(UIColor(named: "ModulesColor")!))
            } else {
                Text(String("connector")).foregroundColor(Color(UIColor(named: "DessertColor")!))
            }
            Text(String(format: "@%@", module.author.nickname))
            Text(Helper.parseDate(dateToParse: module.publishedDateTime)).font(.caption)
            TagsModuleView(tags: module.tags)
        }.padding()
    }
}

struct TagsModuleView: View {
    var tags: [GetUserQuery.Data.User.Module.Result.Tag]
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.name) { tag in
                Text("\(tag.name)")
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color(UIColor(named: "ProfileColor")!), lineWidth: 2)
                )
            }
        }
    }
}

struct ModuleRowIDView: View {
    var module: GetUserQuery.Data.User.Module.Result
    
    var body: some View {
        VStack {
            if module.githubLink != nil && module.githubLink?.count != 0 {
                ModuleRowHeaderView(module: module)
                Divider()
                UIModuleRowView(module: module)
            } else {
                ModuleRowHeaderView(module: module)
                Divider()
                VStack(alignment: .leading) {
                    Text(module.description)
                }.padding()
                Divider()
                VStack(alignment: .center) {
                    Text("No github link was Found :(")
                    Text("Contact the developer of this module!")
                }.padding()
                Spacer()
            }
        }.navigationBarTitle(Text("Module"), displayMode: .inline)
    }
}


struct ModuleRow: View {
    var module: GetUserQuery.Data.User.Module.Result
    
    var body: some View {
        NavigationLink(destination: ModuleRowIDView(module: self.module)) {
            HStack() {
                VStack(alignment: .leading, spacing: 7) {
                    HStack {
                        Text(module.name).font(Font.headline)
                    }
                    Text(String(format: "@%@", module.author.nickname))
                    if module.isCore {
                        Text(String("core")).foregroundColor(Color(UIColor(named: "ModulesColor")!))
                    } else {
                        Text(String("connector")).foregroundColor(Color(UIColor(named: "DessertColor")!))
                    }
                    Text(module.description)
                        .font(Font.body)
                    TagsModuleView(tags: module.tags)
                }
            }
        }
        .padding()
        .background(Color.white)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}

struct ModuleList: View {
    var modules: [GetUserQuery.Data.User.Module.Result]
    
    init(modules: [GetUserQuery.Data.User.Module.Result]) {
        self.modules = modules
        
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        
        // Getting rid of greyish background color
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            if modules.count == 0 {
                Spacer()
                Text("No modules :(")
                Spacer()
            } else {
                List(modules, id: \.id) { module in
                    ModuleRow(module: module)
                }.padding()
            }
        }
    }
}
