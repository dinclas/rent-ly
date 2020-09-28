$(document).ready(async() => {

    const brand_selector = $("select#vehicle_brand")
    const models_selector = $("select#vehicle_model")

    brand_selector.change(async() => {
        models_selector.empty()
        models_selector.val("");

        const selected = brand_selector.find(':selected')
        const brand_id = selected.data('remote-id')
        const models_response = await fetch(`/api/v1/fipe/brands/${brand_id}/models`);

        if(models_response.status === 200) {
            const models = await models_response.json()
            const options = models.map(model => new Option(model.name, model.name))

            models_selector.append(options)
        } else {
            alert('Houve uma falha ao obter a lista de marcas. Por favor, tente novamente mais tarde.')
        }
    })

    const brands_response = await fetch('/api/v1/fipe/brands');
    if(brands_response.status === 200) {
        const brands = await brands_response.json()
        const options = brands.map(brand => {
            const opt = new Option(brand.name, brand.name)
            opt.setAttribute("data-remote-id", brand.id)
            return opt
        })

        brand_selector.append(options)
    } else {
        alert('Houve uma falha ao obter a lista de modelos. Por favor, tente novamente mais tarde.')
    }
})