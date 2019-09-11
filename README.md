Libra Core Dart
===============


The TetherMedia Libra Core library is a pure Dart library designed for use by Dart and Flutter programs to interact with Libra (https://libra.org) nodes on the test network.

> This is still under heavy testing as the Libra testnet is under constant change.

This code started out as a straight port of the Libra wallet library (https://github.com/libra/libra.git) to Dart.  Somewhere along the way, Perfect Makanju released libra-core (https://github.com/perfectmak/libra-core), a JavaScript client for Libra, and parts of that effort were ported here as well to complete this Dart client library, along with some Dart spice added in (e.g. the use of isolates to keep heavy computing off the ui-thread to help with Flutter).

To see the library in action, there is an example Flutter application built for [Android](http://play.google.com/store/apps/details?id=com.tethermedia.libra_wallet_demo) coming soon


## Usage

There are two main interface classes:

- LibraWallet
- LibraClient

### LibraWallet

The LibraWallet allows you to maintain a wallet for use in the Libra TestNetwork.  It has interfaces to create a wallet (which is really just a secure keypair).  New wallets are created with:

    LibraWallet wallet = LibraWallet.create();

Wallets can be restored from a saved Mnemonic:

    const String MNEMONIC = "cage blur unaware ... motion aware";
    LibraWallet wallet = LibraWallet.fromMnemonic(Mnemonic.fromPhrase(MNEMONIC));

Async versions of create and fromMnemonic exist (createAsync and fromMnemonic asysc) which make use of isolates to run the cryptographic
routines in the background, useful for mobile apps.

A LibraWallet holds Account objects.  A wallet may hold more than one Account, each account being a "child" of the wallet. A child is numbered starting with 1.  An Account contains an AccountAddress which is the address used for transferring coins and querying transactions.  A wallet will always generate the same Account/AccountAddress for a child, since creation is dependendant on the keypair that make up the wallet.

    Account account1 = wallet.newAccount();  // generated child 1
    Account account2 = wallet.newAccount();  // generated child 2


The list of Accounts stored has a getter.  It is often more convenient to get the addresses of the Accounts in the wallet, so there is a getter for that too.

    List<AccountAddress> addresses = wallet.addresses;
    List<Account> = wallet.accounts;

The LibraWallet can write a recovery string and restore from that string using  abstract WalletLibraStorage interface that can be defined by the clients.

    LibraWallet wallet = LibraWallet.create();
    WalletLibraMemoryStorage storage = WalletLibraMemoryStorage();
    await wallet.write_recovery(storage);
    LibraWallet rebuiltWallet = await LibraWallet.recover(storage);

A recovered LibraWallet will automatically regenerate the accounts in the wallet.


### LibraClient

The LibraClient class provides the remote interface to the Libra network.  It allows the client app to:

  - transferCoins()
  - getAccountState()
  - getAccountTransaction()
  - Mint coins on the test network

A LibraCoin class was added as a convenience wrapper for Libra coin values.  Libra coin values in
transactions on the network are in micro-libra.  The LibraCoin class does the math and makes
display easier (e.g. 10.55 instead of the BigInt value of 10550000 )

An example of it all glued together:


    LibraClient client = LibraClient(
      LibraLibConfig()
        ..network =  LibraNetwork.Testnet);

    LibraWallet wallet = LibraWallet.create();
    Account account1 = await wallet.newAccount();
    Account account2 = await wallet.newAccount();

    // Mint some coins into account one and wait a bit
    await client.mintWithFaucetService(account1Address, 10);
    await Future.delayed(Duration(seconds: 5));

    // Print amount in account 1
    var account1State = await client.getAccountState(account1);
    print(account1State.balance);

    // Transfer some money from account 1 to account 2
    var response = await client.transferCoins(account1, account2Address, LibraCoin.fromInt(5));
    await Future.delayed(Duration(seconds: 5));

    // Now account 2 has money
    var account2State = await client.getAccountState(account2);
    print(account2State.balance);



## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme



## License
MIT except where noted in file headers.

Author: glachac@tethermedia.com
