import React, { Component } from 'react';
import axios from 'axios';


class Home extends Component {
    componentDidMount(){
        this.getHello();
    }
    constructor(){
        super();
        this.state = {
            hello: ""
        };
        this.getHello = this.getHello.bind(this);
    }

    getHello(){
        axios.get('/home').then((req)=> {
            this.setState({hello:req.data})
        })
    }

    render(){
        let hello = this.state.hello;
        return(
            <div>
                {hello}
            </div>
        )
    }
}
export default Home;