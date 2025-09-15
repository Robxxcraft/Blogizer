import axios from "axios"

const api = axios.create({
    baseURL: 'https://https://blogizer.gt.tc',
    withCredentials: true
})

export default api