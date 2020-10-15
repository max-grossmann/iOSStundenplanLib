# iOSStundenplanLib

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