


Converting Cold to Hot:

```
connectableObservable = coldObservable.publish()

connectableObservable.subscribe(firstSub)
connectableObservable.subscribe(secondSub)

```

// Nothing happens until you call:

```
connectableObservable.connect()


// OR:
connectableObservable.autoConnect(2)

```
it waits until 2 oberserver attach and then automatically starts firing!


// OR:
connectableObservable.refCount() =(almost)= connectableObservable.autoConnect(1)
except, it kills the source as soon as number of subscriptions goes to zero. And it starts over again after another subscription comes in.

```
NOTE: coldObservable.share() === coldObservable.publish().refCount()

```
--------------

```

.defer // one stream - exception must be manually converted to stream-error
.fromCallable // one value - also throws exception automatically in the stream


        Observable<Object> ob1 = Observable.defer(new Callable<ObservableSource<?>>() {
            @Override
            public ObservableSource<?> call() throws Exception {
                return Observable.just("Alpha", "Beta", "Gamma", "Delta",
                        "Epsilon");
            }
        });

        Observable<Object> ob2 = Observable.fromCallable(new Callable<String>() {
            @Override
            public String call() throws Exception {
                return "Something";
            }
        });

```
--------------


scan is very similar to reduce. Except:
- Scan sends every emitted value - good for infinite streams
- reduce only emits one value just before onComplete - only for finite streams



--------------

```
Alpha1 Beta1 Alpha2 Alpha3

toMap    A:Alpha3  B:Beta1
toMultiMap A:Alpha1 Alpha2 Alpha3     B:Beta1

```
---------------



```
.collect(HashSet::new , HashSet::add)

```

--------------


```
combineLatest
withLatestFrom
zip

```

--------------------------


```
   Observable.interval()
   				.replay(2) // last 2 items - returns ConnectableObservable
   				.autoConnect(1);

	prefer to use REPLAY over CACHE as the latter holds on the data forever

```
--------------------------

```
PublishSubject
BehaviorSubject // Caches the last value forever
AsyncSubject // only emits the last value just before onComplete. It waits for onComplete then it emits. Otherwise, it's similar to Behavior Subject.
UnicastSubject


```
------------------

```
mergeMap ==== flatMap
concatMap
switchMap
exhauseMap

```

--------------------



```

.lift for operators
.compose for composing different built it operators
.to for converting:
Utils.Something(observerChain)
to :
observerChain.to(Utils.Something)


```

-----------------------

