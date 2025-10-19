module sui_collectibles::collectibles {

    use sui::tx_context::{TxContext};
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::event;

    /// Objeto principal: representa un coleccionable
    struct Collectible has key, store {
        id: UID,
        name: String,
        description: String,
        creator: address,
    }

    /// Evento que se emite cuando se crea un coleccionable
    struct CreatedEvent has copy, drop {
        creator: address,
        name: String,
    }

    /// Crea un nuevo coleccionable
    public entry fun create_collectible(
        name: String,
        description: String,
        ctx: &mut TxContext
    ): Collectible {
        let collectible = Collectible {
            id: object::new(ctx),
            name,
            description,
            creator: tx_context::sender(ctx),
        };
        event::emit(CreatedEvent { creator: tx_context::sender(ctx), name: collectible.name.clone() });
        collectible
    }

    /// Transfiere un coleccionable a otro usuario
    public entry fun transfer_collectible(collectible: Collectible, recipient: address) {
        transfer::transfer(collectible, recipient);
    }

    /// Consulta (lee) la información de un coleccionable
    public fun get_info(collectible: &Collectible): (String, String, address) {
        (collectible.name.clone(), collectible.description.clone(), collectible.creator)
    }

    /// Cambia la descripción de un coleccionable
    public entry fun update_description(collectible: &mut Collectible, new_desc: String) {
        collectible.description = new_desc;
    }

    /// Elimina un coleccionable (solo su propietario debería poder hacerlo)
    public entry fun delete_collectible(collectible: Collectible) {
        let Collectible { id, name: _, description: _, creator: _ } = collectible;
        object::delete(id);
    }
}
