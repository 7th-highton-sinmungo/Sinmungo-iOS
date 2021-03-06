import ProjectDescription

let projectName = "Sinmungo"
let orginazationIden = "baegteun"

let project = Project(
    name: projectName,
    organizationName: orginazationIden,
    targets: [
        Target(
            name: "\(projectName)",
            platform: .iOS,
            product: .app,
            bundleId: "\(orginazationIden).\(projectName)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            infoPlist: .file(path: "Target/Support/Info.plist"),
            sources: ["Target/Source/**"],
            resources: ["Target/Resource/**"]
        ),
        Target(
            name: "\(projectName)Test",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(orginazationIden).\(projectName)Test",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["TargetTest/Tests/**"],
            dependencies: [
                .target(name: projectName)
            ]
        )
    ]
)
