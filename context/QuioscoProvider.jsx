import {useState, useEffect, createContext} from 'react'
import axios from 'axios'
import { toast } from 'react-toastify'


const QuioscoContext = createContext()


const QuioscoProvider = ({children}) => {

    
    const [categorias, setCategorias] = useState([])
    const [categoriaActual, setCategoriaActual] = useState({})
    const [producto, setProducto] = useState({})
    const [modal, setModal] = useState(false)
    const [pedido, setPedido] = useState([])


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

    const handleAgregarPedido = ({categoriaId, ...producto}) => {

        if(pedido.some( productoState => productoState.id === producto.id )){
            //Actualizar cantidad
            const pedidoActualizado = pedido.map( productoState => productoState.id === producto.id ? producto : productoState )

            setPedido(pedidoActualizado)
            toast.success('Guardado correctamente')
        } else {
            setPedido([...pedido, producto]);
            toast.success(`${producto.nombre} agregado al pedido`)
        }
        
        setModal(false)
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
            handleChangeModal,
            handleAgregarPedido,
            pedido,
        }}>
            {children}
        </QuioscoContext.Provider>
    )
}

export default QuioscoContext
export {QuioscoProvider}