module user::room {
    use std::string;
    use std::signer;
    use aptos_framework::event::{Self};

    struct Room has key,store{
        name: string::String,
    }

    #[event]
    struct RoomEvent has drop, store {
        creator: address
    }


    public fun create_room(creator: &signer,name:string::String){
        let creator_address = signer::address_of(creator);

        let event = RoomEvent{
            creator: creator_address
        };
        event::emit(event);
    }
}
