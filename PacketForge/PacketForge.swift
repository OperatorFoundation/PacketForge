//
//  ContentView.swift
//  PacketForge
//
//  Created by Dr. Brandon Wiley on 6/9/23.
//

import SwiftUI

import Datable
import InternetProtocols

struct PacketForge: View
{
    @State public var host: String = ""
    @State public var port: String = ""
    @State public var connect: Bool = false

    @State public var sourcePort: String = "0"
    @State public var destinationPort: String = "0"
    @State public var sequenceNumber: String = "0"
    @State public var acknowledgementNumber: String = "0"

    @State public var dataOffset: String = "5"

    @State public var cwr: Bool = false
    @State public var ece: Bool = false
    @State public var urg: Bool = false
    @State public var ack: Bool = false
    @State public var psh: Bool = false
    @State public var rst: Bool = false
    @State public var syn: Bool = false
    @State public var fin: Bool = false

    @State public var windowSize: String = "0"

    @State public var checksum: String = "0"
    @State public var urgent: String = "0"

    @State public var options: String = ""

    @State public var received: [TCP] = []

    var body: some View
    {
        VStack
        {
            TextField("Host", text: $host)
            TextField("Port", text: $port)

            Toggle(isOn: $connect)
            {
                switch $connect.wrappedValue
                {
                    case true:
                        Text("Connected")

                    case false:
                        Text("Disconnected")
                }
            }
            .toggleStyle(.switch)

            Divider()

            Group
            {
                HStack
                {
                    TextField("Source Port", text: $sourcePort)
                    .help("Source Port")

                    TextField("Destination Port", text: $destinationPort)
                    .help("Destination Port")
                }

                TextField("Sequence Number", text: $sequenceNumber)
                .help("Sequence Number")

                TextField("Acknowledgement Number", text: $acknowledgementNumber)
                .help("Acknowledgement Number")

                HStack
                {
                    TextField("Data offset", text: $dataOffset)
                    .help("Data offset")

                    Text("0000")
                    .help("Reserved")

                    Group
                    {
                        Toggle(isOn: $cwr)
                        {
                            Text("CWR")
                        }

                        Toggle(isOn: $ece)
                        {
                            Text("ECE")
                        }

                        Toggle(isOn: $urg)
                        {
                            Text("URG")
                        }

                        Toggle(isOn: $ack)
                        {
                            Text("ACK")
                        }

                        Toggle(isOn: $psh)
                        {
                            Text("PSH")
                        }

                        Toggle(isOn: $rst)
                        {
                            Text("RST")
                        }

                        Toggle(isOn: $syn)
                        {
                            Text("SYN")
                        }

                        Toggle(isOn: $fin)
                        {
                            Text("FIN")
                        }
                    }

                    TextField("Window Size", text: $windowSize)
                    .help("Window Size")
                }

                HStack
                {
                    TextField("Checksum", text: $checksum)
                    .help("Checksum")

                    TextField("Urgent Pointer", text: $urgent)
                    .help("Urgent Pointer")
                }

                TextField("Options", text: $options)
                .help("Options")
            }

            HStack
            {
                Button("SYN")
                {
                    print("SYN button")

                    sourcePort = UInt16.random(in: 0..<UInt16.max).string
                    destinationPort = "1234" // FIXME

                    sequenceNumber = UInt32.random(in: 0..<UInt32.max).string
                    acknowledgementNumber = "0"

                    dataOffset = "5"

                    cwr = false
                    ece = false
                    urg = false
                    ack = false
                    psh = false
                    rst = false
                    syn = true
                    fin = false

                    windowSize = "100"

                    checksum = "1234" // FIXME
                    urgent = "0"

                    options = ""
                }
                .help("Generate a new SYN packet")

                Button("Send")
                {
                    print("Send button")
                }
                .help("Send the current packet")
                .disabled(!connect)
            }

            Divider()

            ForEach($received)
            {
                packet in

                Text("hi")
            }
        }
        .padding()
    }
}

struct PacketForge_Previews: PreviewProvider
{
    static var previews: some View
    {
        PacketForge()
    }
}
