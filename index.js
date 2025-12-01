import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
	res.json({
		message: "Hello from a container!",
        service: "hello-node",
        pod: process.env.POD_NAME || "unknown",
        time: new Date().toISOString(),
	});
});


// both of these endpoints just return 200 for kubernetes to known that app is alive and well 
app.get("/readyz", (req, res) => {      
    res.status(200).send("Ready");
});

app.get("/healthz", (req, res) => {      
    res.status(200).send("OK");
});

app.listen(PORT, () => {
	console.log(`Example app listening on port ${PORT}`);
});
