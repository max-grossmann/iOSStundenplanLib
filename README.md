# iOSStundenplanLib

## Demo App

Library wird hier benutzt:  
https://github.com/emuench-hof-university/iOSStundenplanAppLibraryDemo


## Stundenplan abrufen:
```
var cancellable: AnyCancellable = StundenplanAPI.getTestStundenplan()
    .sink(receiveCompletion: { _ in
        print("end")
    }, receiveValue: { (response: Response) in
        for item in response.schedule {
            print("Item: \(item.docent)")
        }
    })

sleep(4)
```