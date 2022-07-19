import {useState, useEffect, createContext} from 'react'
import axios from 'axios'


const QuioscoContext = createContext()


const QuioscoProvider = ({children}) => {

    
    const [categorias, setCategorias] = useState([])
    const [categoriaActual, setCategoriaActual] = useState({})
    const [producto, setProducto] = useState({})
    const [modal, setModal] = useState(false)


    const obtenerCategorias = async () => {
        const respuesta = await axios.get('api/categorias')
        setCategorias(respuesta.data)
    }

    useEffect(() => {
        obtenerCategorias()
    }   , [])   

    useEffect(() => {
        setCategoriaActual(categorias[1])
    }   , [categorias])

    //* Filtrar producto por categoria
    const hadleClickCategoria = (id) => {
        const categoria = categorias.filter( cat => cat.id === id )
        setCategoriaActual(categoria[0]);
    }

    const handleSetProducto = (producto) => {
        setProducto(producto)
    }

    const handleChangeModal = () => {
        setModal(!modal)
    }

    //console.log(categorias);
    return (
        <QuioscoContext.Provider value={{
            categorias,
            hadleClickCategoria,
            categoriaActual,
            handleSetProducto,
            producto,
            handleSetProducto,
            modal,
            handleChangeModal
        }}>
            {children}
        </QuioscoContext.Provider>
    )
}

export default QuioscoContext
export {QuioscoProvider}