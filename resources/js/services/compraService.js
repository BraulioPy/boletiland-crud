export const compraService = {
    getAll(busquedaData = '', pagina = 1) {
        return axios.get(`/api/productos?busqueda=${busquedaData}&page=${pagina}`);
    },
    getById(id) {
        return axios.get(`/api/productos/${id}`);
    },
    create(data) {
        return axios.post('/api/productos', data);
    },
    update(id, data) {
        return axios.put(`/api/productos/${id}`, data);
    },
    delete(id) {
        return axios.delete(`/api/productos/${id}`);
    },
};