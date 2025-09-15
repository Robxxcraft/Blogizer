import axios from "axios"

const api = axios.create({
    baseURL: 'https://blogizer.gt.tc',
    withCredentials: true
})

export default api