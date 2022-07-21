import { useState, useEffect, createContext } from 'react';
import axios from 'axios';
import { toast } from 'react-toastify';
import { useRouter } from 'next/router';

const QuioscoContext = createContext();

const QuioscoProvider = ({ children }) => {
    const [categorias, setCategorias] = useState([]);
    const [categoriaActual, setCategoriaActual] = useState({});
    const [producto, setProducto] = useState({});
    const [modal, setModal] = useState(false);
    const [pedido, setPedido] = useState([]);
    const [nombre, setNombre] = useState('');
    const [total, setTotal] = useState(0);

    const router = useRouter();

    const obtenerCategorias = async () => {
        const respuesta = await axios.get('api/categorias');
        setCategorias(respuesta.data);
    };

    useEffect(() => {
        obtenerCategorias();
    }, []);

    useEffect(() => {
        setCategoriaActual(categorias[1]);
    }, [categorias]);

    useEffect(() => {
        const nuevoTotal = pedido.reduce((total, producto) => (
            producto.precio * producto.cantidad) + total, 0);

        setTotal(nuevoTotal);
    }, [pedido])

    //* Filtrar producto por categoria
    const hadleClickCategoria = (id) => {
        const categoria = categorias.filter((cat) => cat.id === id);
        setCategoriaActual(categoria[0]);
        router.push(`/`);
    };

    const handleSetProducto = (producto) => {
        setProducto(producto);
    };

    const handleChangeModal = () => {
        setModal(!modal);
    };

    const handleAgregarPedido = ({ categoriaId, ...producto }) => {
        if (pedido.some((productoState) => productoState.id === producto.id)) {
            //Actualizar cantidad
            const pedidoActualizado = pedido.map((productoState) =>
                productoState.id === producto.id ? producto : productoState
            );

            setPedido(pedidoActualizado);
            toast.success('Guardado correctamente');
        } else {
            setPedido([...pedido, producto]);
            toast.success(`${producto.nombre} agregado al pedido`);
        }

        setModal(false);
    };

    const handleEditarCantidades = (id) => {
        const productoActualizar = pedido.filter(
            (producto) => producto.id === id
        );
        setProducto(productoActualizar[0]);
        setModal(true);
    };

    const handleEliminarProducto = (id) => {
        const pedidoActualizado = pedido.filter(
            (producto) => producto.id !== id
        );
        setPedido(pedidoActualizado);
    };

    const colocarOrden = async (e) => {
        e.preventDefault();

        try {
            
            const {data} = await axios.post('/api/ordenes', {
                pedido, nombre, total, fecha: Date.now().toString()
            })
            console.log(data);
        
            //resetear pedido
            setCategoriaActual(categorias[0]);
            setPedido([]);
            setNombre('');
            setTotal(0);

            toast.success('Orden colocada correctamente');

            setTimeout(() => {
                router.push('/');

            }, 3000);

        } catch (error) {
            console.log(error);
        }
        
        /* console.log(pedido);
        console.log(nombre);
        console.log(total); */
    };

    //console.log(categorias);
    return (
        <QuioscoContext.Provider
            value={{
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
                handleEditarCantidades,
                handleEliminarProducto,
                nombre,
                setNombre,
                total,
                setTotal,
                colocarOrden,
                total,
            }}
        >
            {children}
        </QuioscoContext.Provider>
    );
};

export default QuioscoContext;
export { QuioscoProvider };
