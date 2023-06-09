//
//  Packet+Identifiable.swift
//  PacketForge
//
//  Created by Dr. Brandon Wiley on 6/9/23.
//

import Foundation

import InternetProtocols

extension TCP: Identifiable
{
    public var id: ObjectIdentifier
    {
        return ObjectIdentifier(TCPClass(tcp: self))
    }
}

public class TCPClass
{
    let tcp: TCP

    public init(tcp: TCP)
    {
        self.tcp = tcp
    }
}
