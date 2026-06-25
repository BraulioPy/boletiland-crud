import axios from "axios";

export const compraService = {
    getAll(busquedaData = "", pagina = 1) {
        return axios.get(
            `/api/compras?busqueda=${busquedaData}&page=${pagina}`,
        );
    },
    getById(id) {
        return axios.get(`/api/compras/${id}`);
    },
    create(data) {
        return axios.post("/api/compras", data);
    },
    update(id, data) {
        return axios.put(`/api/compras/${id}`, data);
    },
    delete(id) {
        return axios.delete(`/api/compras/${id}`);
    },
    exportar() {
        return axios.get("/api/compras/exportar", {
            responseType: "blob",
        });
    },
};
