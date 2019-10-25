[logo]: https://cdn.xy.company/img/brand/XY_Logo_GitHub.png

![logo]

# sdk-xyo-swift

## Table of Contents

-   [Title](#sdk-xyo-swift)
-   [Description](#description)
-   [Start Here](#start-here)
-   [Usage](#usage)
-   [Architecture](#architecture)
-   [Maintainers](#maintainers)
-   [Contributing](#contributing)
-   [License](#license)
-   [Credits](#credits)

## Description 

A high-level SDK for interacting with the XYO network.
Including BLE, TCP/IP, Bound Witnessing, and Bridging. 

## Start Here

Copy this code to test. Look below for specific usage. 

One line is all it takes to start your node 

```swift
let builder = XyoNodeBuilder().setBoundWitnessDelegate(self)
```

For a more complex test, create a listener callback.

You can also configure to your specific roles.

## Usage

Build an XYO Node 

```swift
let builder = XYONodeBuilder()
```

After calling the node builder, you can start the build

```swift
let node = try builder.build()
```

Once you have a build, you have access to properties to help you shape your node and what you want out of it. 

Client

```swift
// select the network - examples
let bleNetwork = node.networks["ble"] as? XyoBleNetwork
let tcpipNetwork = node.networks["tcpip"] as? XyoTcpipNetwork

// a flag to tell the client to automatically scan
bleNetwork?.client.scan = true

// a flag to tell the server to listen
bleNetwork?.server.listen = true
```

You can set bridges for the tcp/ip client for bridging. 

```swift
// set local bridges for the tcpip client
tcpipNetwork?.client.localBridges = ["public key of bridge", "public key of other bridge"]
```
You can set the bound witness delegate

```swift

class SomeViewController: UIViewController, BoundWitnessDelegate {
  func boundWitness(started withDeviceId: String) {
    print("Started BW with (withDeviceId)")
  }

  func boundWitness(completed withDeviceId: String, withBoundWitness: XyoBoundWitness?) {
    print("Completed BW with (withDeviceId)")
  }

}

```

You can also get payload data from bound witness. 

```swift
    class SomeViewController: UIViewController, BoundWitnessDelegate {
        ...
        func getPayloadData() {
            return [UInt8]
        }
    }
```
This will return a byteArray.

There are other properties from the client and server which you can find in the source code as well as a reference guide that we have prepared. 

## Architecture

This sdk is built on a client/server to ensure ease of understanding during development. (The client takes on "central" role, and the server the "peripheral"). This allows us to define roles with simplicity. 

> SDK-XYO-swift TREE

-   XyoSDK
    -   mutableList `<XyoNode>` 

        -   `XyoNode(storage, networks)`
            -   `listeners`
                -   `boundWitnessTarget`
        -   XyoClient, XyoServer

            -   Ble

                -   `context`
                -   `relayNode`
                -   `procedureCatalog`
                -   `autoBridge`
                -   `acceptBridging`
                -   `autoBoundWitness`
                -   `scan`

            -   TcpIp
                -   `relayNode`
                -   `procedureCatalog`
                -   `autoBridge`
                -   `acceptBridging`
                -   `autoBoundWitness`

## Sample App

Please refer to the [iOS sample](/Example/iOSExample/XyoExampleViewController.swift) for an exmple implementation for bound witness and bridging. 

### Install

To use the sample app to measure functionality

-   Launch [Xcode](https://developer.apple.com/xcode/)
-   Click on `Open an existing swift Studio Project`
-   Navigate to `<path to the sdk-xyo-swift>/Example/` in your file explorer
-   Open the project workspace `open XyoSdkExample.xcworkspace`

This sample app includes client bridging and bound witnessing with a BLE server listener. 

## Maintainers

-   Kevin Weiler

## License

See the [LICENSE](LICENSE) file for license details.

## Credits

Made with 🔥and ❄️ by [XY - The Persistent Company](https://www.xy.company)

